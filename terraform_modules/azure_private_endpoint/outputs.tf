//Outputs for App Service Plan
//****************************************************************************
output "id" {
  description = "The id of the newly created Private Endpoint"
  value       = azurerm_private_endpoint.private_endpoint.id
}
output "name" {
  description = "The name of the newly created Private Endpoint"
  value       = azurerm_private_endpoint.private_endpoint.name
}
output "ip_config" {
  description = "The name of the newly created Private Endpoint"
  value       = azurerm_private_endpoint.private_endpoint.network_interface
}
