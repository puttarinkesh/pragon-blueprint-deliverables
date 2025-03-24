//Deploy API's on Azure API Management
//**********************************************************************************************
resource "azurerm_api_management_api" "api_mngmt_api" {
  for_each             = var.api_mngmt_api_deploy
  name                 = lookup(each.value, "name")
  resource_group_name  = lookup(each.value, "resource_group_name")
  api_management_name  = lookup(each.value, "api_management_name")
  revision             = lookup(each.value, "revision")
  display_name         = lookup(each.value, "display_name")
  path                 = lookup(each.value, "path_suffix")
  protocols            = lookup(each.value, "protocols")
  service_url          = lookup(each.value, "service_url")
  terms_of_service_url = lookup(each.value, "terms_of_service_url")

  subscription_key_parameter_names {
    header = lookup(each.value, "sub_header")
    query  = lookup(each.value, "sub_query")
  }

  import {
    content_format = lookup(each.value, "import_content_format")
    content_value  = file("${lookup(each.value, "import_content_value")}")
  }
}
//**********************************************************************************************
