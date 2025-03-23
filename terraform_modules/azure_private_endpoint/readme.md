# Azure Private Endpoint

A private endpoint is a network interface that uses a private IP address from your virtual network. This network interface connects you privately and securely to a service that's powered by Azure Private Link. By enabling a private endpoint, you're bringing the service into your virtual network.

For more information refer the page: https://learn.microsoft.com/en-us/azure/private-link/private-endpoint-overview

## Required Input variables

| Variable Name  | Type  | Is it Required to Pass  |
|----------------|-------|:-----------------------:|
| private_endpoint_name | string | Yes |
| location | string | Yes |
| resource_group_name | string | Yes |
| pe_subnet_id | list(string) | Yes |
| private_service_conn_resource_name | string | Yes |
| private_dns_zone_group_name | string | Yes |
| private_service_conn_resource_id | string | Yes |
| private_service_conn_subresource_names | list(string) | Yes |

