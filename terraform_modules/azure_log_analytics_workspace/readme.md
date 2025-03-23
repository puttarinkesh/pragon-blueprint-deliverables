# Azure Log Analytics workspace 

A Log Analytics workspace is a unique environment for log data from Azure Monitor and other Azure services, such as Microsoft Sentinel and Microsoft Defender for Cloud. Each workspace has its own data repository and configuration but might combine data from multiple services. This article provides an overview of concepts related to Log Analytics workspaces and provides links to other documentation for more details on each.

For more information refer the page: https://learn.microsoft.com/en-us/azure/azure-monitor/logs/log-analytics-workspace-overview

## Required Input variables

| Variable Name  | Type  | Is it Required to Pass  |
|----------------|-------|:-----------------------:|
| log_analytics_workspace_name | string | Yes |
| location | string | Yes |
| resource_group_name | string | Yes |

