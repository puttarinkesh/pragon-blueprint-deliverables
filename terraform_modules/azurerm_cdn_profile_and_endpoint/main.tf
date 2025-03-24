// Add CDN profile and endpoint 
//**********************************************************************************************
resource "azurerm_cdn_profile" "cdn_profile" {
  name                = var.cdn_profile_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.cdn_profile_sku
  tags                = var.tags
}

resource "random_string" "cdn_profile_unique" {
  length  = 10
  special = true
  upper   = false
}

resource "azurerm_cdn_endpoint" "cdn_endpoint" {
  name                          = random_string.cdn_profile_unique.result
  profile_name                  = azurerm_cdn_profile.cdn_profile.name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  origin_host_header            = var.cdn_profile_sto_acc_origin_host_header
  querystring_caching_behaviour = "IgnoreQueryString"
  is_compression_enabled        = true
  content_types_to_compress = [
    "application/eot",
    "application/font",
    "application/font-sfnt",
    "application/javascript",
    "application/json",
    "application/opentype",
    "application/otf",
    "application/pkcs7-mime",
    "application/truetype",
    "application/ttf",
    "application/vnd.ms-fontobject",
    "application/xhtml+xml",
    "application/xml",
    "application/xml+rss",
    "application/x-font-opentype",
    "application/x-font-truetype",
    "application/x-font-ttf",
    "application/x-httpd-cgi",
    "application/x-javascript",
    "application/x-mpegurl",
    "application/x-opentype",
    "application/x-otf",
    "application/x-perl",
    "application/x-ttf",
    "font/eot",
    "font/ttf",
    "font/otf",
    "font/opentype",
    "image/svg+xml",
    "text/css",
    "text/csv",
    "text/html",
    "text/javascript",
    "text/js",
    "text/plain",
    "text/richtext",
    "text/tab-separated-values",
    "text/xml",
    "text/x-script",
    "text/x-component",
    "text/x-java-source",
  ]

  origin {
    name      = var.cdn_profile_origin_name
    host_name = var.cdn_profile_sto_acc_origin_host_header
  }
}
//**********************************************************************************************

//**********************************************************************************************
resource "null_resource" "add_custom_domain" {
  count = var.cdn_profile_custom_domain_name != null ? 1 : 0

  provisioner "local-exec" {
    command = "pwsh ${path.cwd}/Setup-AzCdnCustomDomain.ps1"
    environment = {
      CUSTOM_DOMAIN = var.cdn_profile_custom_domain_name
      RG_NAME       = var.resource_group_name
      FRIENDLY_NAME = var.cdn_profile_friendly_name
    }

  }
  depends_on = [
    azurerm_cdn_endpoint.cdn_endpoint
  ]
}
//**********************************************************************************************