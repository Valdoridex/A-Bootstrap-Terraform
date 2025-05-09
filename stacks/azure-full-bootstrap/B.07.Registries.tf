# TODO: Address these linter hints. Ignored due to small incremental additions for now
# trunk-ignore-begin(checkov)
#### ignore one by one trunk-ignore-begin(checkov/CKV2_AZURE_1,checkov/CKV2_AZURE_33)

resource "azurerm_container_registry" "vdx-acr" {
  name                = "vdx${var.stack-magic-id}"
  resource_group_name = azurerm_resource_group.Vdx-DevOps.name
  location            = var.azure-location
  sku                 = "Basic"
}

# trunk-ignore-end(checkov)