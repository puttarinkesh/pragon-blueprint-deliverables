//Resource Group Variables 
//********************************************************************************************
resource_group_name = "rg-nonprod-bloom-app01"
location            = "central us"
tags = {
  "LOB"           = "IT - Digital" #Line of business
  "Environment"   = "nonprod"
  "Project Owner" = "delivery head"
}

//Virtual Network Variables 
//********************************************************************************************
vnet_name     = "vnet-nonprod-bloom-app01"
address_space = ["10.200.0.0/20"]
dns_servers   = ["192.168.0.0"]

//Subnet Variables 
//********************************************************************************************
subnet_name              = "pe-subnet-nonprod-bloom-app01"
subnet_prefixes          = ["10.200.0.0/24"]
subnet_service_endpoints = ["Microsoft.Web", "Microsoft.Storage", "Microsoft.Sql", "Microsoft.KeyVault"]

subnet_name_application              = "app-subnet-nonprod-bloom-app01"
subnet_prefixes_application          = ["10.200.1.0/24"]
subnet_service_endpoints_application = [] #["Microsoft.Web", "Microsoft.Sql"]

//NSG Variables 
//********************************************************************************************
nsg_name     = "nsg-nonprod-bloom-pe"
nsg_name_application = "nsg-nonprod-bloom-app01"

// Application Insights Variables
//**********************************************************************************************
app_insights_name = "appinsights-nonprod-bloom-app01"

// Variables Private Dns Zone = 
//**********************************************************************************************
private_dns_zone_name           = ["privatelink.azurewebsites.us", "privatelink.database.windows.net", "privatelink.blob.core.windows.net"]
private_dns_zone_vnet_link_name = "linktopublicnonprodapp01"

//Variables for Storage Account 01
//****************************************************************************
storage_account_name           = "stononprodbloomapp01"
storage_account_container_name = "container-nonprod-bloom-app01"

// API Management
//**********************************************************************************************
managed_identity_name    = "azurekeyvault-mi-nonprod-bloom-app01"
api_mgmt_name            = "BlueKC-nonprod-bloom-app01"
api_mgmt_publisher_name  = "BlueKC"
api_mgmt_publisher_email = "IS_ARCH@bluekc.com"


//Azure Log analytics workspace Variables
//**************************************************************************************
log_analytics_workspace_name    = "defaultworkspace-0f87b7f3-b8ff-4c25-b09a-901f6869202e-neu" #"DefaultWorkspace-3ecdf1ce-9807-4068-8538-ccaa15a16fe1-CUS"
log_analytics_workspace_rg_name = "defaultresourcegroup-neu"                                  #"defaultresourcegroup-cus"


// Variables API's on Azure API Management
//**********************************************************************************************
api_name                 = "ApigeePassthrough-app01"
api_display_name         = "ApigeePassthrough-app01"
api_path                 = "apigee"
api_service_url          = "https://bluekc-second-instance-api-import.azure-api.net" #"https://bluekc-nonprod-app01.apigee.net"
api_sub_parameter_header = "Ocp-Subscription-Key"
api_sub_parameter_query  = "subscription-Key"

api_mngmt_api_deploy = {
  "fileboundapi" = {
    name                  = "fileboundapi"
    display_name          = "FileBoundAPI"
    resource_group_name   = "rg-nonprod-app01"
    api_management_name   = "BlueKC-nonprod-app01"
    revision              = "1"
    path_suffix           = "FBapp01/api"
    protocols             = ["https"]
    service_url           = "https://nfm.app01.bcbskc.com/FBapp01/api"
    terms_of_service_url  = "https://apis.app01.bluekc.com/FBapp01/api"
    sub_header            = "Ocp-Subscription-Key"
    sub_query             = "subscription-key"
    import_content_format = "openapi+json"
    import_content_value  = "./fileboundapi.json" #"00"  #local.api_name #"${data.template_file.init.rendered}"  #var.api_name  #data.template_file.init.rendered          #"${path.module}/fileboundapi.json"  #"../fileboundapi.json"  #"app01"  #file("${path.module}/fileboundapi.json")  #"fileboundapi.json" #file(../)  #"
  },
  "crmupdate" = {
    name                  = "crmupdate"
    display_name          = "crmupdate"
    resource_group_name   = "rg-nonprod-app01"
    api_management_name   = "BlueKC-nonprod-app01"
    revision              = "1"
    path_suffix           = "crmupdate"
    protocols             = ["https"]
    service_url           = "https://apis.test.bluekc.com/crmupdate"
    terms_of_service_url  = null
    sub_header            = "Ocp-Subscription-Key"
    sub_query             = "subscription-key"
    import_content_format = "openapi+json"
    import_content_value  = "openapi+json" #"${data.template_file.init.rendered}" #"${api_mngmt_api_deploy.fileboundapi.import_content_value}"  #"00"  #local.api_name #"${data.template_file.init.rendered}"  #var.api_name  #data.template_file.init.rendered          #"${path.module}/fileboundapi.json"  #"../fileboundapi.json"  #"app01"  #file("${path.module}/fileboundapi.json")  #"fileboundapi.json" #file(../)  #"
    import_content_value  = "./CRMUpdate.json"
  }
}






/*
    "crmupdate" = {
    name                  = "crmupdate"
    display_name          = "crmupdate"
    resource_group_name   = "rg-nonprod-app01"
    api_management_name   = "BlueKC-nonprod-app01"
    revision              = "1"
    path_suffix           = "crmupdate"
    protocols             = ["https"]
    service_url           = "https://apis.test.bluekc.com/crmupdate"
    terms_of_service_url  = null
    sub_header            = "Ocp-Subscription-Key"
    sub_query             = "subscription-key"
    import_content_format = "openapi+json"
    #import_content_value  = "${data.template_file.init.rendered}" #"${api_mngmt_api_deploy.fileboundapi.import_content_value}"  #"00"  #local.api_name #"${data.template_file.init.rendered}"  #var.api_name  #data.template_file.init.rendered          #"${path.module}/fileboundapi.json"  #"../fileboundapi.json"  #"app01"  #file("${path.module}/fileboundapi.json")  #"fileboundapi.json" #file(../)  #"
    import_content_value  = ""
  }
  */


// module "api_CRMUpdate" {
//   source                   = "./module_stack/azure_api_management_api"
//   api_name                 = "crmupdate"
//   api_resource_group_name  = module.resource_group.name
//   api_api_management_name  = module.api_management.name
//   api_display_name         = "CRMUpdate"
//   api_path                 = "crmupdate"
//   api_service_url          = "https://apis.test.bluekc.com/crmupdate"
//   api_sub_parameter_header = "Ocp-Subscription-Key"
//   api_sub_parameter_query  = "subscription-key"
//   api_import_content_value = file("${path.module}/crmupdate.json") #file("")  #api-app01-02.json
// }



// api_name_b2cmemberxref                 = "b2cmemberxref"
// api_display_name_b2cmemberxref         = "B2CMemberXref"
// api_path_b2cmemberxref                 = "b2cmemberxref"
// api_service_url_b2cmemberxref          = "https://b2cmemberxref.apps.test.bcbskc.com"
// api_sub_parameter_header_b2cmemberxref = "Ocp-Subscription-Key"
// api_sub_parameter_query_b2cmemberxref  = "subscription-key"
