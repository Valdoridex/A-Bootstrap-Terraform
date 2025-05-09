
# TODO: private endpoint not considered for the moment
# TODO: enforce the other recommendations
# trunk-ignore-begin(checkov/CKV2_AZURE_32,checkov/CKV_AZURE_109,checkov/CKV_AZURE_189)

resource "azurerm_key_vault" "vdx-key-vault" {
  name                        = "vdx-key-vault-${var.stack-magic-id}"
  location                    = var.azure-location
  resource_group_name         = azurerm_resource_group.Vdx-DevOps.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = true
  sku_name                    = "standard"
}

# trunk-ignore-end(checkov/CKV2_AZURE_32,checkov/CKV_AZURE_109,checkov/CKV_AZURE_189)
