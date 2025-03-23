// Variables Private Dns Zone
//**********************************************************************************************
variable "private_dns_zone_enable" {
  description = "(Optional) Enable the creation of private dns zone"
  type        = bool
  default     = true
}
variable "resource_group_name" {
  description = "(Required) A anme identifier for the deployment. Part of the naming scheme."
}
variable "private_dns_zone_vnet_link_name" {
  description = "(Optional) Enable the creation of private dns zone"
  type        = string
}
variable "private_dns_zone_name" {
  type    = list(string)
  default = []
}
variable "virtual_network_id" {
  description = "id of the newly created vNet"
  type        = string
}
variable "tags" {
  description = "(Optional) A mapping of tags to assign to all resources."
  type        = map(any)
  default     = {}
}
//**********************************************************************************************

