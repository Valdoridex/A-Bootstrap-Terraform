resource "azurerm_shared_image_gallery" "vdx-gallery" {
  name                = "vdx_${var.stack-magic-id}"
  resource_group_name = azurerm_resource_group.Vdx-DevOps.name
  location            = var.azure-location
  description         = "Reusable Virtual Machine Images"
  tags                = local.tags
}

resource "azurerm_shared_image" "base-ubuntu-golden" {
  name                = "base-ubuntu-golden"
  gallery_name        = azurerm_shared_image_gallery.vdx-gallery.name
  resource_group_name = azurerm_resource_group.Vdx-DevOps.name
  location            = var.azure-location
  os_type             = "Linux"

  identifier {
    publisher = "Valdoridex"
    offer     = "ubuntu"
    sku       = "base-golden"
  }
  tags = local.tags
}