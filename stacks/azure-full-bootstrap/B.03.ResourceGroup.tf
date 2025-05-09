resource "azurerm_resource_group" "Vdx-DevOps" {
  name     = "Vdx-DevOps"
  location = var.azure-location
  tags     = local.tags
}

# TODO: for production environments, detail this to fine grained permissions
resource "azurerm_role_assignment" "vdx-devops-sp-contributor" {
  scope                = azurerm_resource_group.Vdx-DevOps.id
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.SP-Vdx-DevOps-Agent.object_id
}