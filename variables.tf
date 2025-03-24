// Required Variables for Resource Group
//**********************************************************************************************
variable "resource_group_name" {
  description = "(Required) A name identifier for the deployment. Part of the naming scheme."
}
variable "location" {
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
  default     = "eastus2"
}
variable "tags" {
  description = "(Optional) A mapping of tags to assign to all resources."
  type        = map(any)
  default     = {}
}
//**********************************************************************************************

//VNET Variables 
//********************************************************************************************
variable "vnet_name" {
  description = "Name of the vnet to create"
  type        = string
  default     = "vnet-app-integration-kafka-qa"
}
variable "address_space" {
  type        = list(string)
  description = "The address space that is used by the virtual network."
}
variable "dns_servers" {
  description = "The DNS servers to be used with vNet."
  type        = list(string)
  default     = []
}
//********************************************************************************************

//Subnet Variables 
//********************************************************************************************
variable "subnet_name" {
  description = "A list of public subnets inside the vNet."
  type        = string
}
variable "subnet_prefixes" {
  description = "The address prefix to use for the subnet."
  type        = list(string)
}
variable "subnet_service_endpoints" {
  description = "A map of subnet name to service endpoints to add to the subnet."
  type        = list(string)
  default     = []
}
variable "subnet_name_application" {
  description = "A list of public subnets inside the vNet."
  type        = string
}
variable "subnet_prefixes_application" {
  description = "The address prefix to use for the subnet."
  type        = list(string)
}
variable "subnet_service_endpoints_application" {
  description = "A map of subnet name to service endpoints to add to the subnet."
  type        = list(string)
  default     = []
}
//********************************************************************************************

//NSG Variables 
//********************************************************************************************
variable "nsg_name" {
  description = "(Required) Specifies the name of the network security group. Changing this forces a new resource to be created."
  type        = string
}
variable "nsg_name_application" {
  description = "(Required) Specifies the name of the network security group. Changing this forces a new resource to be created."
  type        = string
}
//********************************************************************************************

//Azure Log analytics workspace Variables
//**************************************************************************************
variable "log_analytics_workspace_name" {
  type        = string
  description = "(Required) Specifies the name of the Log Analytics Workspace. Workspace name should include 4-63 letters, digits or '-'. The '-' shouldn't be the first or the last symbol. Changing this forces a new resource to be created."
}
variable "log_analytics_workspace_rg_name" {
  type        = string
  description = "(Required) Specifies the id of the Log Analytics Workspace resource group name. "
}
//********************************************************************************************

// Application Insights Variables
//**********************************************************************************************
variable "app_insights_name" {
  description = "(Required) Specifies the name of the Application Insights component. Changing this forces a new resource to be created."
  type        = string
}
//********************************************************************************************

// Variables Private Dns Zone
//**********************************************************************************************
variable "private_dns_zone_name" {
  type    = list(string)
  default = []
}
variable "private_dns_zone_vnet_link_name" {
  description = "(Optional) Enable the creation of private dns zone"
  type        = string
}
//********************************************************************************************

//Variables for Storage Account 01
//****************************************************************************
variable "storage_account_name" {
  description = "(Optional) A unique identifier for the storage account. Part of the naming scheme."
  type        = string
}
variable "storage_account_container_name" {
  description = "(Required) The name of the Container which should be created within the Storage Account. Changing this forces a new resource to be created."
}

// API Management
//**********************************************************************************************
variable "managed_identity_name" {
  description = "(Required) The environment where resources will be deployed into. Part of the naming scheme."
}
variable "api_mgmt_name" {
  description = "(Required) The name of the api management will be deployed "
}
variable "api_mgmt_publisher_name" {
  description = " (Required) The name of publisher/company."
  type        = string
}
variable "api_mgmt_publisher_email" {
  description = " (Required) The email of publisher/company."
  type        = string
}
//**********************************************************************************************

// Variables API's on Azure API Management
//**********************************************************************************************
variable "api_name" {
  description = "(Required) The name of the API Management API. Changing this forces a new resource to be created."
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
  default     = null
}
//**********************************************************************************************

// Variables API's on Azure API Management
//**********************************************************************************************
variable "api_mngmt_api_deploy" {
  type = map(object({
    name                  = string
    display_name          = string
    resource_group_name   = string
    api_management_name   = string
    revision              = string
    path_suffix           = string
    protocols             = list(string)
    service_url           = string
    terms_of_service_url  = string
    sub_header            = string
    sub_query             = string
    import_content_format = string
    import_content_value  = any
  }))
}
//**********************************************************************************************

// Azure Key Vault Variables
//**********************************************************************************************
variable "key_vault_name" {
  description = "(Required) Specifies the name of the keyvault. Changing this forces a new resource to be created"
}
variable "keyvault_purge_protection_enabled" {
  type        = bool
  description = "(Optional) When purge protection is on, a vault or an object in the deleted state cannot be purged until the retention period has passed."
  default     = false
}
//**********************************************************************************************

// Setup Azure SQL Database
//**********************************************************************************************
variable "sql_database_name" {
  description = "(Required) A string that is appended to the end of the database name to identify it."
}
variable "sql_server_id" {
  description = "(Required) The id of the Ms SQL Server on which to create the database. Changing this forces a new resource to be created."
}
//**********************************************************************************************
