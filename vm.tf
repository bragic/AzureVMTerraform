resource "azurerm_network_interface" "nic" {
  for_each = toset(local.vm_names)

  name                = "${each.key}-nic"
  location            = var.primary_location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }

}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each            = toset(local.vm_names)
  name                = each.key
  location            = var.primary_location
  resource_group_name = var.resource_group_name
  size                = local.vm_size
  admin_username      = var.admin_username
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
    disk_size_gb         = 100
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  disable_password_authentication = true
}
