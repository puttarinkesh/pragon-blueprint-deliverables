//Route Table
//********************************************************************************************
resource "azurerm_route_table" "route_table" {
  name                          = var.route_table_name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  disable_bgp_route_propagation = var.route_table1_disable_bgp_propagation
}
//********************************************************************************************

// Route table association
//**********************************************************************************************
resource "azurerm_subnet_route_table_association" "route_table1" {
  subnet_id      = var.subnet_id
  route_table_id = azurerm_route_table.route_table.id
}
//**********************************************************************************************