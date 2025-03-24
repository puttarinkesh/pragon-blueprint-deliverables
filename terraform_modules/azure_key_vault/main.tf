// Deploy Azure Key Vault 
//**********************************************************************************************
resource "azurerm_key_vault" "key_vault" {
  name                            = var.key_vault_name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  tenant_id                       = var.tenant_id
  sku_name                        = var.keyvault_sku_name
  enabled_for_deployment          = var.keyvault_enabled_for_deployment
  enabled_for_disk_encryption     = var.keyvault_enabled_for_disk_encryption
  enabled_for_template_deployment = var.keyvault_enabled_for_template_deployment
  purge_protection_enabled        = var.keyvault_purge_protection_enabled

  network_acls {
    default_action             = var.keyvault_nacl_default_action
    bypass                     = var.keyvault_az_svcs_bypass
    ip_rules                   = var.keyvault_nacl_allowed_ips
    virtual_network_subnet_ids = var.keyvault_nacl_allowed_subnets
  }

  tags = var.tags
}
//**********************************************************************************************