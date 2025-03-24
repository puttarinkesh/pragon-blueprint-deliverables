// Required Variables for Resource Group
//**********************************************************************************************
variable "resource_group_name" {
  description = "(Required) A anme identifier for the deployment. Part of the naming scheme."
}
variable "location" {
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}
variable "tags" {
  description = "(Optional) A mapping of tags to assign to all resources."
  type        = map(any)
  default     = {}
}
//**********************************************************************************************