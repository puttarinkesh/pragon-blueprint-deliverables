//Deploy API's on Azure API Management
//**********************************************************************************************
resource "azurerm_api_management_api" "api_mngmt_api" {
  name                = var.api_name                #"ApigeePassthrough-Demo"
  resource_group_name = var.api_resource_group_name #module.resource_group.name
  api_management_name = var.api_api_management_name #module.api_management.name
  revision            = var.api_revision            #"1"
  display_name        = var.api_display_name        #"ApigeePassthrough-Demo"
  path                = var.api_path                #"apigee"
  protocols           = var.api_protocols           #
  service_url         = var.api_service_url         #"https://bluekc-nonprod-test.apigee.net"

  subscription_key_parameter_names {
    header = var.api_sub_parameter_header #"Ocp-Apim-Subscription-Key"
    query  = var.api_sub_parameter_query  #"subscription-Key"
  }

  import {
    content_format = var.api_import_content_format #"openapi+json" # "swagger-json"
    #content_value  = jsondecode(file("${path.module}/${var.api_import_content_value}")) #jsondecode(var.api_import_content_value) #jsondecode(file("${path.module}/${var.api_import_content_value}")) #var.api_import_content_value    #<<JSON
    content_value = var.api_import_content_value
  }

  #     import {
  #     content_format = var.api_import_content_format #"openapi+json" # "swagger-json"
  #     #content_value  = jsondecode(file("${path.module}/${var.api_import_content_value}")) #jsondecode(var.api_import_content_value) #jsondecode(file("${path.module}/${var.api_import_content_value}")) #var.api_import_content_value    #<<JSON
  #     content_value = <<JSON
  #       {
  #     "openapi": "3.0.1",
  #     "info": {
  #         "title": "ApigeePassthrough",
  #         "description": "",
  #         "version": "1.0"
  #     },
  #     "servers": [{
  #         "url": "https://apis.test.bluekc.com/apigee"
  #     }, {
  #         "url": "https://idcard-qr.test.bcbskc.com/apigee"
  #     }, {
  #         "url": "https://apis.a.test.bluekc.com/apigee"
  #     }],
  #     "paths": {
  #         "/oauth/client_credential/accesstoken": {
  #             "post": {
  #                 "summary": "OauthAccessToken",
  #                 "operationId": "oauthaccesstoken",
  #                 "responses": {
  #                     "200": {
  #                         "description": null
  #                     }
  #                 }
  #             }
  #         }
  #     },
  #     "components": {
  #         "securitySchemes": {
  #             "apiKeyHeader": {
  #                 "type": "apiKey",
  #                 "name": "Ocp-Apim-Subscription-Key",
  #                 "in": "header"
  #             },
  #             "apiKeyQuery": {
  #                 "type": "apiKey",
  #                 "name": "subscription-key",
  #                 "in": "query"
  #             }
  #         }
  #     },
  #     "security": [{
  #         "apiKeyHeader": []
  #     }, {
  #         "apiKeyQuery": []
  #     }]
  # }
  # JSON
  #  }


}
//**********************************************************************************************


# data "template_file" "init" {
#   template = "${file("./example.tpl")}"
# }













