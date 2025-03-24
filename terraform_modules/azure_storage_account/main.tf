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