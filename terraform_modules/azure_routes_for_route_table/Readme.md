# Azure Routes to be assigned to Route table

Azure routes traffic between all subnets within a virtual network, by default. You can create your own routes to override Azure's default routing. Custom routes are helpful when, for example, you want to route traffic between subnets through a network virtual appliance (NVA).

For more information refer the page: https://learn.microsoft.com/en-us/azure/virtual-network/tutorial-create-route-table-portal

## Required Input variables

| Variable Name  | Type  | Is it Required to Pass  |
|----------------|-------|:-----------------------:|
| route_name | string | Yes |
| route_table_name | string | Yes |
| resource_group_name | string | Yes |
| route_address_prefix | string | Yes |
| route_next_hop_in_ip_address | string | Yes |


