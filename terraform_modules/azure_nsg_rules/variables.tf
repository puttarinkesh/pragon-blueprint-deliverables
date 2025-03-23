//**********************************************************************************************
variable "deploy_subnet_nsg_rule" {
  description = "(Optional) A boolean to enable/disable the deployment of a subnet NSG for the VM."
  default     = false
}
variable "network_security_group_name" {
  description = "Name of the NSG to create NSG rules under it"
  type        = string
}
variable "resource_group_name" {
  description = "Name of the resource group to be imported."
  type        = string
}
variable "nsg_rule_name" {
  description = " (Required) The name of the security rule. This needs to be unique across all Rules in the Network Security Group. Changing this forces a new resource to be created."
  type        = string
}
variable "nsg_rule_priority" {
  description = "(Required) Specifies the priority of the rule. The value can be between 100 and 4096. The priority number must be unique for each rule in the collection. The lower the priority number, the higher the priority of the rule."
  type        = string
}
variable "nsg_rule_direction" {
  description = "(Required) The direction specifies if rule will be evaluated on incoming or outgoing traffic. Possible values are Inbound and Outbound."
  type        = string
  default     = "Inbound"
}
variable "nsg_rule_access" {
  description = " (Required) Specifies whether network traffic is allowed or denied. Possible values are Allow and Deny."
  type        = string
  default     = "Allow"
}
variable "nsg_rule_protocol" {
  description = "(Required) Network protocol this rule applies to. Possible values include Tcp, Udp, Icmp, Esp, Ah or * (which matches all)."
  type        = string
  default     = "Tcp"
}
variable "nsg_rule_source_port_range" {
  description = "(Optional) Source Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if source_port_ranges is not specified."
  type        = string
  default     = "*"
}
variable "nsg_rule_destination_port_range" {
  description = "(Optional) Destination Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if destination_port_ranges is not specified."
  type        = string
  default     = "*"
}
variable "nsg_rule_source_address_prefix" {
  description = " (Optional) CIDR or source IP range or * to match any IP. Tags such as VirtualNetwork, AzureLoadBalancer and Internet can also be used. This is required if source_address_prefixes is not specified."
  type        = string
  default     = "virtualnetwork"
}
variable "nsg_rule_destination_address_prefix" {
  description = " (Optional) CIDR or destination IP range or * to match any IP. Tags such as VirtualNetwork, AzureLoadBalancer and Internet can also be used. Besides, it also supports all available Service Tags like ‘Sql.WestEurope‘, ‘Storage.EastUS‘, etc. You can list the available service tags with the CLI: shell az network list-service-tags --location westcentralus. For further information please see Azure CLI - az network list-service-tags. This is required if destination_address_prefixes is not specified."
  type        = string
  default     = "*"
}
//**********************************************************************************************







variable "nsg_rule_" {
  description = ""
  type        = string
}