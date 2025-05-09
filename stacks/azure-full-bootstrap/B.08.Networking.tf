resource "azurerm_virtual_network" "vdx-nw" {
  name                = "vdx-network"
  address_space       = ["10.0.0.0/16"]
  location            = var.azure-location
  resource_group_name = azurerm_resource_group.Vdx-DevOps.name
  tags                = local.tags
}

resource "azurerm_subnet" "vdx-internal" {
  name                 = "vdx-internal"
  resource_group_name  = azurerm_resource_group.Vdx-DevOps.name
  virtual_network_name = azurerm_virtual_network.vdx-nw.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_security_group" "vdx-nsg" {
  name                = "vdx-nsg"
  location            = var.azure-location
  resource_group_name = azurerm_resource_group.Vdx-DevOps.name
  tags                = local.tags
}

resource "azurerm_subnet_network_security_group_association" "nsg-subnet-assoc" {
  subnet_id                 = azurerm_subnet.vdx-internal.id
  network_security_group_id = azurerm_network_security_group.vdx-nsg.id
}