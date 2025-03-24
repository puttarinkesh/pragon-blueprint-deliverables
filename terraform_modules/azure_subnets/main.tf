//Creating subnet for - vnet_subnet
//********************************************************************************************
resource "azurerm_subnet" "vnet_subnet" {
  name                                          = var.subnet_name
  resource_group_name                           = var.resource_group_name
  virtual_network_name                          = var.virtual_network_name
  address_prefixes                              = var.subnet_prefixes
  service_endpoints                             = var.subnet_service_endpoints
  private_endpoint_network_policies             = var.private_endpoint_network_policies
  private_link_service_network_policies_enabled = var.private_link_service_network_policies_enabled
}
//********************************************************************************************

