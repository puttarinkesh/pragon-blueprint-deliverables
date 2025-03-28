// Set Inbound NSG Rules
//**********************************************************************************************
resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}


resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  subnet_id                 = var.nsg_association_subnet_id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
//**********************************************************************************************