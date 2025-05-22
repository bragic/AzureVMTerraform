data "azurerm_virtual_network" "vnet" {
  name                = "vnet1"
  resource_group_name = var.resource_group_name
}

data "azurerm_subnet" "subnet" {
  name                 = "subnet1"
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = var.resource_group_name
}

data "azurerm_network_security_group" "nsg" {
  name                = "nsg1"
  resource_group_name = var.resource_group_name
}
