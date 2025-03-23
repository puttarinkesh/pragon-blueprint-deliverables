//Outputs for Log Analytics Insights
//****************************************************************************
output "id" {
  description = "The id of the newly App Insights"
  value       = azurerm_log_analytics_workspace.log_analytics_workspace.id
}
output "name" {
  description = "The name of the newly App Insights"
  value       = azurerm_log_analytics_workspace.log_analytics_workspace.name
}
output "workspace_id" {
  description = "The workspace id of the newly App Insights"
  value       = azurerm_log_analytics_workspace.log_analytics_workspace.workspace_id
}