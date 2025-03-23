// Create Azure Private Endpoint
//**********************************************************************************************
resource "azurerm_private_endpoint" "private_endpoint" {
  name                = var.private_endpoint_name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.pe_subnet_id

  private_dns_zone_group {
    name                 = var.private_dns_zone_group_name
    private_dns_zone_ids = var.private_dns_zone_ids
  }

  private_service_connection {
    name                           = var.private_service_conn_resource_name
    private_connection_resource_id = var.private_service_conn_resource_id
    is_manual_connection           = var.private_service_conn_manual_connection
    subresource_names              = var.private_service_conn_subresource_names
  }
  tags = var.tags
}
//**********************************************************************************************