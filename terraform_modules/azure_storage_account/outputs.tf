//Outputs for storage account
//****************************************************************************
output "name" {
  description = "The name of the newly created storage account"
  value       = azurerm_storage_account.storage_account.name
}
output "id" {
  description = "The name of the newly created storage account"
  value       = azurerm_storage_account.storage_account.id
}
output "primary_access_key" {
  description = "The name of the newly created storage account"
  value       = azurerm_storage_account.storage_account.primary_access_key
}
//****************************************************************************