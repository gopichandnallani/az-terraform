resource "azurerm_network_interface" "dev-interface" {
  count               = length(var.subnetcidrs)
  name                = var.interface_name
  location            = var.location
  resource_group_name = azurerm_resource_group.devrg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.devsubnet.*.id[count.index]
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.dev_pip.id
  }
}

resource "azurerm_public_ip" "dev_pip" {
  name                = var.devpip-name
  location            = azurerm_resource_group.devrg.location
  resource_group_name = azurerm_resource_group.devrg.name
  allocation_method   = "Static"
}


resource "azurerm_windows_virtual_machine" "example" {
  name                = "Dev-vm-1"
  resource_group_name = azurerm_resource_group.devrg.name
  location            = azurerm_resource_group.devrg.location
  size                = "Standard_B1s"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.dev-interface[0].id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}
