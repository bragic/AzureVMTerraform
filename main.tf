data "azurerm_resource_group" "main" {
  name = "rg-prod-infra"
}

locals {
  vm_names = ["ubuntu-vm-01", "ubuntu-vm-02"]
  vm_size  = "Standard_B2ms"
}


