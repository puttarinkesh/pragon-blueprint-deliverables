// Setup Azure SQL Database
//**********************************************************************************************
resource "azurerm_mssql_database" "sql_database" {
  name               = var.sql_database_name
  server_id          = var.sql_server_id
  collation          = var.sql_database_collation
  license_type       = var.sql_database_license
  max_size_gb        = var.sql_database_size
  read_scale         = var.sql_database_read
  sku_name           = var.sql_database_sku
  zone_redundant     = var.sql_database_redudant
  create_mode        = var.sql_database_create_mode
  read_replica_count = var.sql_database_replica_count
  elastic_pool_id    = var.sql_database_sku == "ElasticPool" ? var.sql_database_elastic_pool_id : null //With this conditional you can create a single database and a database included in an ElasticPool Group, that depends on the sku included.

  short_term_retention_policy {
    retention_days = var.sql_database_STR_retention
  }

  long_term_retention_policy {
    weekly_retention = var.sql_database_LTR_weekly_retention
    week_of_year     = var.sql_database_LTR_week_of_year
  }

  dynamic "threat_detection_policy" {
    for_each = var.sql_database_threat_policy_state == "Enabled" ? 1 : 0
    content {
      state                      = var.sql_database_threat_policy_state
      storage_account_access_key = var.storage_account_access_key
      storage_endpoint           = var.storage_account_endpoint
      disabled_alerts            = var.sql_database_disabled_alerts
      retention_days             = var.sql_database_threat_logs_retention
      email_account_admins       = var.sql_database_threat_email_admins
      email_addresses            = var.sql_database_threat_emails
    }
  }

  threat_detection_policy {
    state                      = var.sql_database_threat_policy_state
    storage_account_access_key = var.storage_account_access_key
    storage_endpoint           = var.storage_account_endpoint
    disabled_alerts            = var.sql_database_disabled_alerts
    retention_days             = var.sql_database_threat_logs_retention
    email_account_admins       = var.sql_database_threat_email_admins
    email_addresses            = var.sql_database_threat_emails
  }

  tags = var.tags

  timeouts {
    create = local.timeout_duration
    delete = local.timeout_duration
  }

  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      long_term_retention_policy,
    ]
  }
}
//**********************************************************************************************

// Sets up diagnostics for Azure SQL Database
//**********************************************************************************************
resource "azurerm_monitor_diagnostic_setting" "sql_database_diagnostic_settings" {
  count                      = var.sql_database_enabled_diagnostic_settings ? 1 : 0
  name                       = "${var.sql_database_name}-diag"
  target_resource_id         = azurerm_mssql_database.sql_database.id
  log_analytics_workspace_id = var.sql_database_workspace_id

  dynamic "log" {
    for_each = var.sql_database_diagnostics.logs
    content {
      category = log.value

      retention_policy {
        enabled = false
        days    = 0
      }
    }
  }

  dynamic "metric" {
    for_each = var.sql_database_diagnostics.metrics
    content {
      category = metric.value

      retention_policy {
        enabled = false
        days    = 0
      }
    }
  }
}
//**********************************************************************************************