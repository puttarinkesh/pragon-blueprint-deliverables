// Variables
//**********************************************************************************************
variable "managed_identity_name" {
  description = "(Required) The environment where resources will be deployed into. Part of the naming scheme."
}
variable "api_mgmt_name" {
  description = "(Required) The name of the api management will be deployed "
}
variable "api_mgmt_rg_name" {
  description = "(Required) The name of the resource group where the api management will be deployed to."
}
variable "location" {
  description = "(Required) The cloud region where resources will be deployed into."
}
variable "api_mgmt_log_analytics_workspace_id" {
  description = "(Required) The the log analytics workspace ID for diagnostics."
  default     = null
}
variable "api_mgmt_publisher_name" {
  description = " (Required) The name of publisher/company."
  type        = string
}
variable "api_mgmt_publisher_email" {
  description = " (Required) The email of publisher/company."
  type        = string
}
variable "api_mgmt_sku_name" {
  description = " (Optional) sku_name is a string consisting of two parts separated by an underscore(_)"
  type        = string
  default     = "Developer_1"
}
variable "api_mgmt_min_api_version" {
  description = "(Optional) The version which the control plane API calls to API Management service are limited with version equal to or newer than."
  type        = string
  default     = "2019-12-01"
}
variable "api_mgmt_virtual_network_type" {
  description = "(Optional) The type of virtual network you want to use, valid values include: None, External, Internal. Defaults to None."
  type        = string
  default     = "Internal"
}
variable "api_mgmt_subnet_id" {
  description = " (Required) The id of the subnet that will be used for the API Management."
}
variable "api_mgmt_network_security_group_rg_name" {
  description = " (Required) The resource group name of nsg that will be used for the API Management."
}
variable "api_mgmt_network_security_group_name" {
  description = " (Required) The name of nsg that will be used for the API Management."
}
variable "tags" {
  description = "(Optional) A mapping of tags to assign to all resources."
  type        = map(any)
  default     = {}
}
//**********************************************************************************************