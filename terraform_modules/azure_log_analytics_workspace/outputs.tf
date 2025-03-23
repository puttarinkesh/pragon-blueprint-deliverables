//Outputs for Log Analytics Insights
//****************************************************************************
output "id" {
  description = "The name of the newly App Insights"
  value       = azurerm_log_analytics_workspace.log_analytics_workspace.id
}
output "name" {
  description = "The name of the newly App Insights"
  value       = azurerm_log_analytics_workspace.log_analytics_workspace.name
}