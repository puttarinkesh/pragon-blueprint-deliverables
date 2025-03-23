//Outputs for storage account
//****************************************************************************
output "name" {
  description = "The name of the newly created storage account"
  value       = azurerm_storage_account.storage_account_01.name
}
output "id" {
  description = "The name of the newly created storage account"
  value       = azurerm_storage_account.storage_account_01.id
}
output "primary_access_key" {
  description = "The name of the newly created storage account"
  value       = azurerm_storage_account.storage_account_01.primary_access_key
}
//****************************************************************************