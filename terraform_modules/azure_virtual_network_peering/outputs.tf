//Outputs for Vnet and Subnets
//****************************************************************************
output "id" {
  description = "The id of the newly created Virtual Network Peering"
  value       = azurerm_virtual_network_peering.vnet_peering.id
}
output "name" {
  description = "The id of the newly created Virtual Network Peering"
  value       = azurerm_virtual_network_peering.vnet_peering.name
}
//****************************************************************************