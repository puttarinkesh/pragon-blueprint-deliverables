//Route Table variables
//********************************************************************************************
variable "route_table_name" {
  description = "(Required) The name of the route table. Changing this forces a new resource to be created."
  type        = string
}
variable "resource_group_name" {
  description = "Name of the resource group to be imported."
  type        = string
}
variable "location" {
  description = "Location to create the vnet"
  type        = string
}
variable "route_table1_disable_bgp_propagation" {
  description = "(Optional) Boolean flag which controls propagation of routes learned by BGP on that route table. True means disable."
  type        = bool
  default     = false
}
variable "subnet_id" {
  description = "(Required) The Subnet ID. Changing this forces a new resource to be created."
  type        = string
}
//********************************************************************************************
