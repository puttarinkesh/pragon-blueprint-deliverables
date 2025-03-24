//Outputs for Azure SQL Database
//****************************************************************************
output "sql_database_name" {
  description = "Database name of the Azure SQL Database created."
  value       = azurerm_mssql_database.sql_database.name
  sensitive   = false
}
output "sql_database_name_id" {
  description = "Version the Azure SQL Database created."
  value       = azurerm_mssql_database.sql_database.id
  sensitive   = true
}
output "sql_database" {
  description = "Database name of the Azure SQL Database created."
  value       = azurerm_mssql_database.sql_database
}
output "sql_database_diagnostic_settings" {
  value = azurerm_monitor_diagnostic_setting.sql_database_diagnostic_settings
}
//****************************************************************************