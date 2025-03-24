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

  static_website {
    index_document = "index.html"
  }
}
//**********************************************************************************************

//Manages the Static Website of an Azure Storage Account.
//**********************************************************************************************
resource "azurerm_storage_account_static_website" "static_website" {
  count              = var.storage_account_static_website_deploy ? 1 : 0
  storage_account_id = azurerm_storage_account.storage_account.id
  error_404_document = var.storage_account_static_website_error_404_document
  index_document     = var.storage_account_static_website_index_document
}
//**********************************************************************************************

