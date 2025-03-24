# Azure Virtual Network

Azure Virtual Network is a service that provides the fundamental building block for your private network in Azure. An instance of the service (a virtual network) enables many types of Azure resources to securely communicate with each other, the internet, and on-premises networks. These Azure resources include virtual machines (VMs).

A virtual network is similar to a traditional network that you'd operate in your own datacenter. But it brings extra benefits of the Azure infrastructure, such as scale, availability, and isolation.

For more information refer the page: https://learn.microsoft.com/en-us/azure/virtual-network/virtual-networks-overview

## Required Input variables

| Variable Name  | Type  | Is it Required to Pass  |
|----------------|-------|:-----------------------:|
| vnet_name | string | Yes |
| location | string | Yes |
| resource_group_name | string | Yes |
| address_space | list(string) | Yes |

