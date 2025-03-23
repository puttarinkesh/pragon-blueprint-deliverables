# Azure Resource Group

A resource group is a container that holds related resources for an Azure solution. The resource group can include all the resources for the solution, or only those resources that you want to manage as a group. You decide how you want to allocate resources to resource groups based on what makes the most sense for your organization. Generally, add resources that share the same lifecycle to the same resource group so you can easily deploy, update, and delete them as a group.

For more information refer the page: https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/manage-resource-groups-portal

## Required Input variables

| Variable Name  | Type  | Is it Required to Pass  |
|----------------|-------|:-----------------------:|
| env | string | Yes |
| postfix | string | Yes |
| location | string | Yes |

