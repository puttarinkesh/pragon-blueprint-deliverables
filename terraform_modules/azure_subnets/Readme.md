# Azure Virtual Network - subnets

A subnet is a range of IP addresses in the virtual network. You can divide a virtual network into multiple subnets for organization and security. Each NIC in a VM is connected to one subnet in one virtual network. NICs connected to subnets (same or different) within a virtual network can communicate with each other without any extra configuration.

For more information refer the page: https://learn.microsoft.com/en-us/azure/virtual-network/network-overview#virtual-network-and-subnets

## Required Input variables

| Variable Name  | Type  | Is it Required to Pass  |
|----------------|-------|:-----------------------:|
| subnet_name | string | Yes |
| resource_group_name | string | Yes |
| virtual_network_name | string | Yes |
| subnet_prefixes | list(string) | Yes |


