// Deploy the storage account
//**********************************************************************************************
resource "azurerm_storage_account" "storage_account" {
  name                          = var.storage_account_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  account_tier                  = var.storage_account_tier
  account_replication_type      = var.storage_account_replication_type
  account_kind                  = var.storage_account_kind
  access_tier                   = var.storage_account_access_tier
  public_network_access_enabled = var.storage_account_allow_blob_public_access
  https_traffic_only_enabled    = var.storage_account_enable_https_traffic_only
  min_tls_version               = var.storage_account_tls_version
  tags                          = var.tags
}
//**********************************************************************************************

// Sets up diagnostics for Storage Account
//**********************************************************************************************
resource "azurerm_monitor_diagnostic_setting" "storage_account_diagnostic_setting" {
  name                       = "${var.storage_account_name}-diag"
  target_resource_id         = azurerm_storage_account.storage_account.id
  log_analytics_workspace_id = var.storage_account_log_analytics_workspace_id

  dynamic "enabled_log" {
    for_each = var.cl_storage_account_diagnostics.enabled_log
    content {
      category = enabled_log.value
    }
  }

  dynamic "metric" {
    for_each = var.cl_storage_account_diagnostics.metrics
    content {
      category = metric.value
    }
  }
}
//**********************************************************************************************