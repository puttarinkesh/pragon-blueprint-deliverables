//Route Table variables
//********************************************************************************************
variable "route_name" {
  description = "(Required) The name of the route. Changing this forces a new resource to be created."
  type        = string
}
variable "route_table_name" {
  description = "(Required) The name of the route table. Changing this forces a new resource to be created."
  type        = string
}
variable "resource_group_name" {
  description = "Name of the resource group to be imported."
  type        = string
}
variable "route_address_prefix" {
  description = "(Required) The name of the route. Changing this forces a new resource to be created."
  type        = string
}
variable "route_next_hop_type" {
  description = "(Required) The type of Azure hop the packet should be sent to. Possible values are VirtualNetworkGateway, VnetLocal, Internet, VirtualAppliance and None."
  type        = string
  default     = "VirtualAppliance"
}
variable "route_next_hop_in_ip_address" {
  description = "(Optional) Contains the IP address packets should be forwarded to. Next hop values are only allowed in routes where the next hop type is VirtualAppliance."
  type        = string
}
//****************************************************************************