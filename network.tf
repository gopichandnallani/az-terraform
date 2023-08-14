# network security group
resource "azurerm_network_security_group" "nsg1" {
  name                = var.nsg1name
  location            = azurerm_resource_group.devrg.location
  resource_group_name = azurerm_resource_group.devrg.name
}

#virtual network 
resource "azurerm_virtual_network" "vnet1" {
  name                = var.vnet1name
  location            = azurerm_resource_group.devrg.location
  resource_group_name = azurerm_resource_group.devrg.name
  address_space       = var.cidr
}

resource "azurerm_subnet" "devsubnet" {
  count                = length(var.subnetcidrs)
  name                 = "dev-subnet-${count.index + 1}"
  resource_group_name  = azurerm_resource_group.devrg.name
  address_prefixes     = [var.subnetcidrs[count.index]]
  virtual_network_name = azurerm_virtual_network.vnet1.name
}
