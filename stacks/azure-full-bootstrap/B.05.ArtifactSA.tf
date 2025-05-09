# TODO: Address these linter hints. Ignored due to small incremental additions for now
# trunk-ignore-begin(checkov)
#### ignore one by one trunk-ignore-begin(checkov/CKV2_AZURE_1,checkov/CKV2_AZURE_33)

resource "azurerm_storage_account" "devopsartifacts" {
  name                     = "ciartifacts${var.stack-magic-id}"
  location                 = var.azure-location
  resource_group_name      = azurerm_resource_group.Vdx-DevOps.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = local.tags
}

resource "azurerm_storage_share" "devops-artifacts-share" {
  name               = "ciartfshare${var.stack-magic-id}"
  storage_account_id = azurerm_storage_account.devopsartifacts.id
  quota              = 256
}

# trunk-ignore-end(checkov)