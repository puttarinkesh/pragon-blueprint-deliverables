//Outputs for Log Analytics Insights
//****************************************************************************
output "id" {
  description = "The id of the newly App Insights"
  value       = azurerm_key_vault.key_vault.id
}
output "name" {
  description = "The name of the newly App Insights"
  value       = azurerm_key_vault.key_vault.name
}
output "key_vault" {
  description = "The workspace id of the newly App Insights"
  value       = azurerm_key_vault.key_vault
}
//****************************************************************************