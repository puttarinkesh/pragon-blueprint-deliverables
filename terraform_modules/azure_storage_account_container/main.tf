// Deploy the storage account Container
//**********************************************************************************************
resource "azurerm_storage_container" "storage_account_container" {
  name                  = var.storage_account_container_name
  storage_account_name  = var.storage_account_name
  container_access_type = var.storage_account_container_access_type
}
//**********************************************************************************************