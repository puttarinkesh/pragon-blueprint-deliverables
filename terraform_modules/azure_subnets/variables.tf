//Subnet Variables 
//********************************************************************************************
variable "subnet_name" {
  description = "A list of public subnets inside the vNet."
  type        = string
}
variable "resource_group_name" {
  description = "Name of the resource group to be imported."
  type        = string
}
variable "virtual_network_name" {
  description = " (Required) The name of the virtual network in which the subnet is created in. Changing this forces a new resource to be created."
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
variable "private_endpoint_network_policies" {
  description = " (Optional) Enable or Disable network policies for the private endpoint on the subnet. Setting this to true will Enable the policy and setting this to false will Disable the policy. Defaults to true."
  type        = string
  default     = "Enabled"
}
variable "private_link_service_network_policies_enabled" {
  description = "(Optional) Enable or Disable network policies for the private link service on the subnet. Setting this to true will Enable the policy and setting this to false will Disable the policy. Defaults to true."
  type        = bool
  default     = true
}
//********************************************************************************************
