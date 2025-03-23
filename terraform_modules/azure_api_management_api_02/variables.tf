// Variables API's on Azure API Management
//**********************************************************************************************
variable "api_mngmt_api_deploy" {
  type = map(object({
    name                  = string
    display_name          = string
    resource_group_name   = string
    api_management_name   = string
    revision              = string
    path_suffix           = string
    protocols             = list(string)
    service_url           = string
    terms_of_service_url  = string
    sub_header            = string
    sub_query             = string
    import_content_format = string
    import_content_value  = any
  }))
}
//**********************************************************************************************

