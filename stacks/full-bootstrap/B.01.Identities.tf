data "azuread_client_config" "current" {}

resource "azuread_application" "Vdx-DevOps-Agent" {
  display_name = var.devops-application-name
  owners       = [data.azuread_client_config.current.object_id]
}