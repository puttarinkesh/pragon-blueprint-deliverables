//**********************************************************************************************

//**********************************************************************************************
variable "nsg_id" {
  description = "(Required) Specifies the name of the network security group. Changing this forces a new resource to be created."
  type        = string
}
variable "nsg_association_subnet_id" {
  description = "(Required) The ID of the Subnet. Changing this forces a new resource to be created."
}
//**********************************************************************************************





