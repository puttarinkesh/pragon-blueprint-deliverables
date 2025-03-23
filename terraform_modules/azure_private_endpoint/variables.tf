//**********************************************************************************************
variable "private_endpoint_name" {
  description = "(Required) Specifies the Name of the Private Endpoint. Changing this forces a new resource to be created."
  type        = string
}
variable "location" {
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}
variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the namespace. Changing this forces a new resource to be created."
  type        = string
}
variable "pe_subnet_id" {
  type        = list(string)
  description = "(Optional) One or more Subnet ID's which should be able to access this datafactory."
  default     = []
}
variable "private_dns_zone_group_name" {
  description = "(Required) Specifies the Name of the Private DNS Zone Group."
  type        = string
  default     = null
}
variable "private_dns_zone_ids" {
  description = "(Optional) Specifies the list of Private DNS Zones to include within the private_dns_zone_group."
  type        = list(string)
  default     = []
}
variable "private_service_conn_resource_name" {
  type        = string
  description = "(Required) The Name of the IP Configuration."
  default     = null
}
variable "private_service_conn_resource_id" {
  type        = string
  description = "(Optional) The ID of the Private Link Enabled Remote Resource which this Private Endpoint should be connected to. One of private_connection_resource_id or private_connection_resource_alias must be specified. Changing this forces a new resource to be created. For a web app or function app slot, the parent web app should be used in this field instead of a reference to the slot itself."
}
variable "private_service_conn_manual_connection" {
  type        = bool
  description = "(Required) Does the Private Endpoint require Manual Approval from the remote resource owner? Changing this forces a new resource to be created."
  default     = false
}
variable "private_service_conn_subresource_names" {
  type        = list(string)
  description = "(Optional) A list of subresource names which the Private Endpoint is able to connect to. subresource_names corresponds to group_id. Possible values are detailed in the product documentation in the Subresources column. Changing this forces a new resource to be created."
  default     = []
}
variable "tags" {
  description = "(Optional) A mapping of tags to assign to all resources."
  type        = map(any)
  default     = {}
}
//**********************************************************************************************