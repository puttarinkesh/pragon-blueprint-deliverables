//Deploy Private DNS Zone
//**********************************************************************************************
resource "azurerm_private_dns_zone" "dns_zones" {
  for_each            = toset(var.private_dns_zone_name)
  name                = each.key
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "sharedsvs_dns_zones" {
  for_each              = toset(var.private_dns_zone_name)
  name                  = var.private_dns_zone_vnet_link_name #"linkto${replace(each.key, "privatelink.", "")}"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.dns_zones[each.key].name
  virtual_network_id    = var.virtual_network_id
  tags                  = var.tags
}
//**********************************************************************************************