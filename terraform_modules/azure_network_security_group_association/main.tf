// NSG Association
//**********************************************************************************************
resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  subnet_id                 = var.nsg_association_subnet_id
  network_security_group_id = var.nsg_id
}
//**********************************************************************************************