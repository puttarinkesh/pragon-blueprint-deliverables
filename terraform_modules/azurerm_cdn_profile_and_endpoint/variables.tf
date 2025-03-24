//Variables for CDN profile
//****************************************************************************
variable "cdn_profile_name" {
  description = "(Optional) A unique identifier for the  Add CDN profile and endpoint . Part of the naming scheme."
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
variable "cdn_profile_sku" {
  type        = string
  description = " (Required) The pricing related information of current CDN profile. Accepted values are Standard_Akamai, Standard_ChinaCdn, Standard_Microsoft, Standard_Verizon or Premium_Verizon. Changing this forces a new resource to be created."
  default     = "Standard_Microsoft"
}
variable "tags" {
  description = "(Optional) A mapping of tags to assign to all resources."
  type        = map(any)
  default     = {}
}
variable "cdn_profile_sto_acc_origin_host_header" {
  type        = string
  description = " (Optional) The host header CDN provider will send along with content requests to origins."
  default     = null
}
variable "cdn_profile_origin_name" {
  type        = string
  description = "(Required) The name of the origin. This is an arbitrary value. However, this value needs to be unique under the endpoint. Changing this forces a new resource to be created."
  default     = "orginaccount"
}
variable "cdn_profile_custom_domain_name" {
  type        = string
  description = "(Optional) The name of the cdn_profile_custom_domain_name"
  default     = null
}
variable "cdn_profile_friendly_name" {
  type        = string
  description = "The friendly name of your custom domain in the Azure Portal"
  default     = null
}
variable "cdn_profile_sto_acc_origin_host_name_url" {
  type        = string
  description = " (Optional) The host url CDN provider will send along with content requests to origins."
  default     = null
}