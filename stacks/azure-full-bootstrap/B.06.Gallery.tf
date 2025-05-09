resource "azurerm_shared_image_gallery" "vdx-gallery" {
  name                = "vdx_${var.stack-magic-id}"
  resource_group_name = azurerm_resource_group.Vdx-DevOps.name
  location            = var.azure-location
  description         = "Reusable Virtual Machine Images"
  tags                = local.tags
}