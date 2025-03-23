//User assigned identity 
//***************************************************************************
resource "azurerm_user_assigned_identity" "apim_managed_identity" {
  name                = var.managed_identity_name
  location            = var.location
  resource_group_name = var.api_mgmt_rg_name
  tags                = var.tags
}
//***************************************************************************

//Azure API Management 
//***************************************************************************
resource "azurerm_api_management" "api_mgmt" {
  name                 = var.api_mgmt_name
  location             = var.location
  resource_group_name  = var.api_mgmt_rg_name
  publisher_email      = var.api_mgmt_publisher_email
  publisher_name       = var.api_mgmt_publisher_name
  sku_name             = var.api_mgmt_sku_name
  virtual_network_type = var.api_mgmt_virtual_network_type
  min_api_version      = var.api_mgmt_min_api_version
  tags                 = var.tags

  virtual_network_configuration {
    subnet_id = var.api_mgmt_subnet_id
  }

  protocols {
    enable_http2 = true
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.apim_managed_identity.id]
  }

  depends_on = [azurerm_subnet_network_security_group_association.apim_nsg_association]

  timeouts {
    create = "2h"
  }
}
//***************************************************************************

//Azure API Management 
//***************************************************************************
data "azurerm_network_security_group" "nsg" {
  name                = var.api_mgmt_network_security_group_name
  resource_group_name = var.api_mgmt_network_security_group_rg_name
}

resource "azurerm_network_security_rule" "default_nsg" {
  name                        = "TESTAllowCidrBlockCustom443Inbound"
  priority                    = 150
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "10.0.0.0/8"
  destination_address_prefix  = "*"
  resource_group_name         = data.azurerm_network_security_group.nsg.resource_group_name
  network_security_group_name = data.azurerm_network_security_group.nsg.name
}

resource "azurerm_network_security_rule" "apim_nsg" {
  name                        = "AllAPIManagementInbound"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3443"
  source_address_prefix       = "ApiManagement"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = data.azurerm_network_security_group.nsg.resource_group_name
  network_security_group_name = data.azurerm_network_security_group.nsg.name
}


resource "azurerm_network_security_rule" "apim_nsg_load_balancer" {
  name                        = "AllowAzureLoadBalancerInbound"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "AzureLoadBalancer"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = data.azurerm_network_security_group.nsg.resource_group_name
  network_security_group_name = data.azurerm_network_security_group.nsg.name
}

resource "azurerm_network_security_rule" "apim_keyvault_rule" {
  name                        = "AllowAzureKeyVaultHTTPSOutbound"
  priority                    = 140
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "AzureKeyVault"
  resource_group_name         = data.azurerm_network_security_group.nsg.resource_group_name
  network_security_group_name = data.azurerm_network_security_group.nsg.name
}

resource "azurerm_network_security_rule" "apim_storage_rule" {
  name                        = "AllowHTTPSOutbound"
  priority                    = 120
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "Storage"
  resource_group_name         = data.azurerm_network_security_group.nsg.resource_group_name
  network_security_group_name = data.azurerm_network_security_group.nsg.name
}

resource "azurerm_network_security_rule" "apim_sql_rule" {
  name                        = "AllowSQLOutbound"
  priority                    = 130
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "1433"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "Sql"
  resource_group_name         = data.azurerm_network_security_group.nsg.resource_group_name
  network_security_group_name = data.azurerm_network_security_group.nsg.name
}

resource "azurerm_subnet_network_security_group_association" "apim_nsg_association" {
  subnet_id                 = var.api_mgmt_subnet_id
  network_security_group_id = data.azurerm_network_security_group.nsg.id
}
//***************************************************************************