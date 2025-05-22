data "azurerm_virtual_network" "vnet" {
  name                = "eastus"
  resource_group_name = var.resource_group_name
}

data "azurerm_subnet" "subnet" {
  name                 = "sec-nondmz-prod-01"
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = var.resource_group_name
}

data "azurerm_network_security_group" "nsg" {
  name                = "sec-nondmz-prod-01"
  resource_group_name = var.resource_group_name
}
