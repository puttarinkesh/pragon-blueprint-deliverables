//Outputs for App Service Plan
//****************************************************************************
output "id" {
  description = "The name of the newly storage account Container"
  value       = azurerm_storage_container.storage_account_container.id
}
output "name" {
  description = "The name of the newly storage account Container"
  value       = azurerm_storage_container.storage_account_container.name
}
//****************************************************************************