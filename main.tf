//Resource Group Deployment
module "resource_group" {
  source              = "./module_stack/azure_resource_groups"
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

//Virtual Network Deployment
module "virtual_network" {
  source              = "./module_stack/azure_virtual_network"
  vnet_name           = var.vnet_name
  resource_group_name = module.resource_group.name
  location            = var.location
  address_space       = var.address_space
  dns_servers         = var.dns_servers
  tags                = var.tags
}

module "subnet" {
  source                   = "./module_stack/azure_subnets"
  subnet_name              = var.subnet_name
  resource_group_name      = module.virtual_network.resource_group_name
  virtual_network_name     = module.virtual_network.name
  subnet_prefixes          = var.subnet_prefixes
  subnet_service_endpoints = var.subnet_service_endpoints
}

module "network_security_group" {
  source                    = "./module_stack/azure_network_security_group"
  nsg_name                  = var.nsg_name
  location                  = module.virtual_network.location
  resource_group_name       = module.virtual_network.resource_group_name
  nsg_association_subnet_id = module.subnet.id
  tags                      = var.tags
}

module "application_insights" {
  source              = "./module_stack/azure_application_insights"
  app_insights_name   = var.app_insights_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  workspace_id        = data.azurerm_log_analytics_workspace.existing_log_analytics_ws.id
  tags                = var.tags
}

module "application_insights_fep_member" {
  source              = "./module_stack/azure_application_insights"
  app_insights_name   = var.app_insights_name_fep_member
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  workspace_id        = data.azurerm_log_analytics_workspace.existing_log_analytics_ws.id
  tags                = var.tags
}


module "private_dns_zone" {
  source                          = "./module_stack/azure_private_dns_zone"
  private_dns_zone_name           = var.private_dns_zone_name
  resource_group_name             = module.virtual_network.resource_group_name
  private_dns_zone_vnet_link_name = module.virtual_network.name
  virtual_network_id              = module.virtual_network.id
  tags                            = var.tags
}


# module "api_management" {
#   source                                  = "./module_stack/azure_api_management"
#   managed_identity_name                   = var.managed_identity_name
#   api_mgmt_name                           = var.api_mgmt_name
#   api_mgmt_rg_name                        = module.resource_group.name
#   location                                = module.resource_group.location
#   api_mgmt_publisher_name                 = var.api_mgmt_publisher_name
#   api_mgmt_publisher_email                = var.api_mgmt_publisher_email
#   api_mgmt_subnet_id                      = module.subnet.id
#   api_mgmt_network_security_group_rg_name = module.network_security_group.resource_group_name
#   api_mgmt_network_security_group_name    = module.network_security_group.name
#   tags                                    = var.tags
# }



# module "log_analytics_workspace" {
#   source                       = "./module_stack/azure_log_analytics_workspace"
#   log_analytics_workspace_name = var.log_analytics_workspace_name
#   resource_group_name          = module.resource_group_qa.name
#   location                     = module.resource_group_qa.location
# }



module "api" {
  source                   = "./module_stack/azure_api_management_api"
  api_name                 = var.api_name
  api_resource_group_name  = "APIM-RG-NonProd-Test"                   #module.resource_group.name
  api_api_management_name  = "APIM-BlueKC-Second-Instance-API-Import" #module.api_management.name
  api_display_name         = var.api_display_name
  api_path                 = var.api_path
  api_service_url          = var.api_service_url
  api_sub_parameter_header = var.api_sub_parameter_header
  api_sub_parameter_query  = var.api_sub_parameter_query
  api_import_content_value = file("${path.module}/api-demo-02.json")
}


module "api02" {
  source                   = "./module_stack/azure_api_management_api"
  api_name                 = "ApigeePassthrough-Demo-02"
  api_resource_group_name  = "APIM-RG-NonProd-Test"                   #module.resource_group.name
  api_api_management_name  = "APIM-BlueKC-Second-Instance-API-Import" #module.api_management.name
  api_display_name         = "ApigeePassthrough-Demo-02"              #var.api_display_name
  api_path                 = "apigee"                                 #var.api_path #"echo"                                   #var.api_path
  api_service_url          = var.api_service_url                      #"https://apim-bluekc-second-instance-api-import.azure-api.net/echo" #"http://echoapi.cloudapp.net/api" #var.api_service_url
  api_sub_parameter_header = var.api_sub_parameter_header
  api_sub_parameter_query  = var.api_sub_parameter_query
  api_import_content_value = file("${path.module}/api-demo-02.json")
}
# //**********************************************************************************************




module "api_final_poc" {
  source = "./module_stack/azure_api_management_api_02"
  api_mngmt_api_deploy  = var.api_mngmt_api_deploy
}











# data "template_file" "init" {
#   template = "${file("./CRMUpdate.json")}"
# }











/*
terraform plan -target="module.api_final_poc"
terraform apply -target="module.api_final_poc" -auto-approve


terraform plan -target="module.api02"
terraform apply -target="module.api02" -auto-approve

*/