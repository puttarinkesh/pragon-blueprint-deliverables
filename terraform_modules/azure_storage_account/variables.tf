//Variables for Storage Account 01
//****************************************************************************
variable "storage_account_name" {
  description = "(Optional) A unique identifier for the storage account. Part of the naming scheme."
  type        = string
}
variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which the Log Analytics workspace is created. Changing this forces a new resource to be created."
}
variable "location" {
  type        = string
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}
variable "storage_account_tier" {
  description = "(Optional) The pricing tier for the storage account."
  default     = "Standard"
}
variable "storage_account_replication_type" {
  description = "(Optional) Defines the type of replication to use for this storage account."
  default     = "LRS"
}
variable "storage_account_kind" {
  description = "(Optional)  Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2."
  default     = "StorageV2"
}
variable "storage_account_access_tier" {
  description = "(Optional) Defines the access tier for BlobStorage, FileStorage and StorageV2 accounts. Valid options are Hot and Cool"
  default     = "Cool"
}
variable "storage_account_allow_blob_public_access" {
  description = "(Optional) Public access"
  default     = true
}
variable "storage_account_enable_https_traffic_only" {
  description = "(Optional) Enable https traffic  access"
  default     = true
}
variable "storage_account_tls_version" {
  description = "(Optional) The minimum supported TLS version for the storage account. Possible values are TLS1_0, TLS1_1, and TLS1_2."
  default     = "TLS1_2"
}
variable "tags" {
  description = "(Optional) A mapping of tags to assign to all resources."
  type        = map(any)
  default     = {}
}
variable "storage_account_static_website_deploy" {
  description = "(Optional) Enable https traffic  access"
  type        = bool
  default     = false
}
variable "storage_account_static_website_error_404_document" {
  type        = string
  description = "(Optional) The absolute path to a custom webpage that should be used when a request is made which does not correspond to an existing file."
  default     = "404.html"
}
variable "storage_account_static_website_index_document" {
  type        = string
  description = "(Optional) The webpage that Azure Storage serves for requests to the root of a website or any subfolder. For example, index.html."
  default     = "index.html"
}
//****************************************************************************

