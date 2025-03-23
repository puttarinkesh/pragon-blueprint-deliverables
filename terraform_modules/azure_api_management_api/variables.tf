// Variables API's on Azure API Management
//**********************************************************************************************
variable "api_name" {
  description = "(Required) The name of the API Management API. Changing this forces a new resource to be created."
  type        = string
}
variable "api_resource_group_name" {
  description = " (Required) The Name of the Resource Group where the API Management API exists. Changing this forces a new resource to be created."
  type        = string
}
variable "api_api_management_name" {
  description = "(Required) The Name of the API Management Service where this API should be created. Changing this forces a new resource to be created."
  type        = string
}
variable "api_display_name" {
  description = "(Optional) The display name of the API."
  type        = string
}
variable "api_revision" {
  description = " (Required) The Revision which used for this API. Changing this forces a new resource to be created."
  type        = string
  default     = "1"
}
variable "api_path" {
  description = "(Optional) The Path for this API Management API, which is a relative URL which uniquely identifies this API and all of its resource paths within the API Management Service."
  type        = string
}
variable "api_protocols" {
  description = "(Optional) A list of protocols the operations in this API can be invoked. Possible values are http, https, ws, and wss."
  type        = list(string)
  default     = ["https"]
}
variable "api_service_url" {
  description = "(Optional) Absolute URL of the backend service implementing this API."
  type        = string
  default     = null
}
variable "api_sub_parameter_header" {
  description = "(Required) The name of the HTTP Header which should be used for the Subscription Key."
  type        = string
  default     = null
}
variable "api_sub_parameter_query" {
  description = "(Required) The name of the QueryString parameter which should be used for the Subscription Key."
  type        = string
  default     = null
}
variable "api_import_content_format" {
  description = "(Required) The format of the content from which the API Definition should be imported. Possible values are: openapi, openapi+json, openapi+json-link, openapi-link, swagger-json, swagger-link-json, wadl-link-json, wadl-xml, wsdl and wsdl-link."
  type        = string
  default     = "openapi+json"
}
variable "api_import_content_value" {
  description = " (Required) The Content from which the API Definition should be imported. When a content_format of *-link-* is specified this must be a URL, otherwise this must be defined inline."
  type        = any
  default     = null
}
//**********************************************************************************************

