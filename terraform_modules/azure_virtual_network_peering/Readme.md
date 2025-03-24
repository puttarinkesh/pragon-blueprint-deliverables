# Azure Virtual network peering

Virtual network peering enables you to seamlessly connect two or more Virtual Networks in Azure. The virtual networks appear as one for connectivity purposes. The traffic between virtual machines in peered virtual networks uses the Microsoft backbone infrastructure. Like traffic between virtual machines in the same network, traffic is routed through Microsoft's private network only.

For more information refer the page: https://learn.microsoft.com/en-us/azure/virtual-network/virtual-network-peering-overview

## Required Input variables

| Variable Name  | Type  | Is it Required to Pass  |
|----------------|-------|:-----------------------:|
| vnet_peering_name | string | Yes |
| location | string | Yes |
| virtual_network_name | string | Yes |
| remote_virtual_network_id | string | Yes |
