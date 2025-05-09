resource "azurerm_resource_group" "Vdx-DevOps" {
  name     = "Vdx-DevOps"
  location = var.azure-location
  tags     = local.tags
}