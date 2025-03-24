//Outputs for storage account
//****************************************************************************
output "name" {
  description = "The name of the newly created storage account"
  value       = azurerm_storage_account.storage_account.name
}
output "id" {
  description = "The id of the newly created storage account"
  value       = azurerm_storage_account.storage_account.id
}
output "primary_access_key" {
  description = "The name of the newly created storage account"
  value       = azurerm_storage_account.storage_account.primary_access_key
}
output "primary_web_host" {
  description = "The id of the newly created storage account"
  value       = azurerm_storage_account.storage_account.primary_web_host
}
output "static_website_id" {
  description = "The id of the newly created static_website_id"
  value       = azurerm_storage_account_static_website.static_website.0.id
}
//****************************************************************************