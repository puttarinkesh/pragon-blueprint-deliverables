# Azure Route Table

Azure automatically routes traffic between Azure subnets, virtual networks, and on-premises networks. If you want to change Azure's default routing, you do so by creating a route table. If you're new to routing in virtual networks, you can learn more about it in virtual network traffic routing or by completing a tutorial.

For more information refer the page: https://learn.microsoft.com/en-us/azure/virtual-network/manage-route-table

## Required Input variables

| Variable Name  | Type  | Is it Required to Pass  |
|----------------|-------|:-----------------------:|
| route_table_name | string | Yes |
| location | string | Yes |
| resource_group_name | string | Yes |
| subnet_id | string | Yes |
