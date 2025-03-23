//Outputs for App Insights
//****************************************************************************
output "id" {
  description = "The name of the newly App Insights"
  value       = azurerm_application_insights.app_insights.id
}
output "name" {
  description = "The name of the newly App Insights"
  value       = azurerm_application_insights.app_insights.name
}