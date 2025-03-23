//Creating - Virtual Network (VNET)
//********************************************************************************************
resource "azurerm_virtual_network" "virtual_network" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.address_space
  dns_servers         = var.dns_servers
  tags                = var.tags

  timeouts {
    create = local.timeout_duration
    delete = local.timeout_duration
  }
}
//********************************************************************************************
