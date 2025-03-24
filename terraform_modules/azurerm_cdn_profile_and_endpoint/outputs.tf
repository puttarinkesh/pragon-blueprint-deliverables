//Outputs for storage account
//****************************************************************************
output "cdn_profile_name" {
  description = "The name of the newly created storage account"
  value       = azurerm_cdn_profile.cdn_profile.name
}
output "cdn_profile_id" {
  description = "The id of the newly created storage account"
  value       = azurerm_cdn_profile.cdn_profile.id
}
output "cdn_endpoint_name" {
  description = "The name of the newly created storage account"
  value       = azurerm_cdn_endpoint.cdn_endpoint.name
}
output "cdn_endpoint_id" {
  description = "The id of the newly created storage account"
  value       = azurerm_cdn_endpoint.cdn_endpoint.id
}
//****************************************************************************