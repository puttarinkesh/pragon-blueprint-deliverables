// Required Variables
//**********************************************************************************************
variable "sql_database_name" {
  description = "(Required) A string that is appended to the end of the database name to identify it."
}
variable "sql_server_id" {
  description = "(Required) The id of the Ms SQL Server on which to create the database. Changing this forces a new resource to be created."
}
variable "storage_account_endpoint" {
  description = "(Required) Specifies the blob storage endpoint."
  default     = null
}
variable "storage_account_access_key" {
  description = "(Required) Specifies the access key to use for the auditing storage account."
  default     = null
}
variable "sql_database_workspace_id" {
  description = "(Required) The the log analytics workspace ID for diagnostics."
  default     = null
}
//**********************************************************************************************

// Optional Variables
//**********************************************************************************************
variable "tags" {
  description = "(Optional) A mapping of tags to assign to all resources."
  type        = map(any)
  default     = {}
}

variable "sql_database_collation" {
  description = "(Optional) Specifies the collation of the database. Changing this forces a new resource to be created."
  type        = string
  default     = "SQL_Latin1_General_CP1_CI_AS"
}

variable "sql_database_license" {
  description = "(Optional) Specifies the license type applied to this database. Possible values are LicenseIncluded and BasePrice."
  type        = string
  default     = "BasePrice"
}

variable "sql_database_size" {
  description = "(Optional) The max size of the database in gigabytes."
  type        = number
  default     = 1
}

variable "sql_database_read" {
  description = "(Optional) If enabled, connections that have application intent set to readonly in their connection string may be routed to a readonly secondary replica. This property is only settable for Premium and Business Critical databases."
  type        = bool
  default     = false
}

variable "sql_database_sku" {
  description = "(Optional) Specifies the name of the sku used by the database. Changing this forces a new resource to be created. Single Database default value: BC_Gen5_2. If the database require be include in Elastic Pool group, in variable sku default value: ElasticPool."
  type        = string
  default     = "BC_Gen5_2"
}

variable "sql_database_redudant" {
  description = "(Optional) Whether or not this database is zone redundant, which means the replicas of this database will be spread across multiple availability zones. This property is only settable for Premium and Business Critical databases."
  type        = bool
  default     = false
}

variable "sql_database_create_mode" {
  type        = string
  description = "(Optional) The create mode of the database. Possible values are Copy, Default, OnlineSecondary, PointInTimeRestore, Recovery, Restore, RestoreExternalBackup, RestoreExternalBackupSecondary, RestoreLongTermRetentionBackup and Secondary."
  default     = "Default"
}

variable "sql_database_replica_count" {
  description = "(Optional) The number of readonly secondary replicas associated with the database to which readonly application intent connections may be routed. This property is only settable for Hyperscale edition databases."
  type        = number
  default     = null
}

variable "sql_database_STR_retention" {
  description = "(Required) Point In Time Restore configuration. Value has to be between 7 and 35."
  type        = number
  default     = 35
}

variable "sql_database_LTR_weekly_retention" {
  description = "(Optional) The weekly retention policy for an LTR backup in an ISO 8601 format. Valid value is between 1 to 120 months. e.g. P1Y, P1M, P4W or P30D."
  type        = string
  default     = "P1W"
}

variable "sql_database_LTR_week_of_year" {
  description = "(Optional) The week of year to take the yearly backup in an ISO 8601 format. Value has to be between 1 and 52."
  type        = number
  default     = 1
}
variable "sql_database_disabled_alerts" {
  description = "(Optional) Specifies a list of alerts which should be disabled. Possible values include Access_Anomaly, Sql_Injection and Sql_Injection_Vulnerability."
  type        = list(string)
  default     = []
}
variable "sql_database_enabled_diagnostic_settings" {
  description = "(Optional) Boolean to enable monitor diagnostic setting resource creation"
  type        = bool
  default     = false
}
variable "sql_database_audit_retention_days" {
  description = "(Optional) Specifies the number of days to retain logs for in the storage account."
  type        = number
  default     = 7
}
variable "sql_database_diagnostics" {
  description = "(Optional) Diagnostic settings for those resources that support it."
  type        = object({ enable_log = list(string), metrics = list(string) })
  default = {
    enable_log    = ["SQLInsights", "AutomaticTuning", "QueryStoreRuntimeStatistics", "QueryStoreWaitStatistics", "Errors", "DatabaseWaitStatistics", "Timeouts", "Blocks", "Deadlocks"]
    metrics = ["Basic", "InstanceAndAppAdvanced", "WorkloadManagement"]
  }
}
variable "sql_database_elastic_pool_id" {
  description = "(Optional) The Elastic Pool id to Integrate the DB with one azure sql elastic pool."
  type        = string
  default     = null
}
//**********************************************************************************************


// Local Variables
//**********************************************************************************************
locals {
  timeout_duration = "2h"
}
//**********************************************************************************************