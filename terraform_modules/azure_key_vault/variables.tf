// Required Variables
//**********************************************************************************************
variable "key_vault_name" {
  description = "(Required) Specifies the name of the keyvault. Changing this forces a new resource to be created"
}
variable "resource_group_name" {
  description = "(Required) The resource group for the keyvault."
}
variable "location" {
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}
variable "tenant_id" {
  description = "(Required) The tenant ID that the resources will reside in."
}
variable "keyvault_sku_name" {
  description = "(Optional) The Name of the SKU used for Key Vault"
  type        = string
  default     = "standard"
}
variable "keyvault_enabled_for_deployment" {
  type        = bool
  description = "(Optional) Boolean to enable vms to be able to fetch from keyvault."
  default     = true
}
variable "keyvault_enabled_for_disk_encryption" {
  type        = bool
  description = "(Optional) Boolean to enable vms to use keyvault certificates for disk encryption."
  default     = true
}
variable "keyvault_enabled_for_template_deployment" {
  type        = bool
  description = "(Optional) Boolean to enable azure resource manager deployments to be able to fetch from keyvault."
  default     = false
}
variable "keyvault_purge_protection_enabled" {
  type        = bool
  description = "(Optional) When purge protection is on, a vault or an object in the deleted state cannot be purged until the retention period has passed."
  default     = true
}
variable "keyvault_nacl_default_action" {
  description = "(Optional) The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids."
  type        = string
  default     = "Allow"
}
variable "keyvault_az_svcs_bypass" {
  type        = string
  description = "(Optional) Specifies which traffic can bypass the network rules."
  default     = "AzureServices"
}
variable "keyvault_nacl_allowed_ips" {
  type        = list(string)
  description = "(Optional)  One or more IP Addresses, or CIDR Blocks which should be able to access the Key Vault."
  default     = []
}
variable "keyvault_nacl_allowed_subnets" {
  type        = list(string)
  description = "(Optional) One or more Subnet ID's which should be able to access this Key Vault."
  default     = []
}
variable "tags" {
  description = "(Optional) A mapping of tags to assign to all resources."
  type        = map(any)
  default     = {}
}

//**********************************************************************************************