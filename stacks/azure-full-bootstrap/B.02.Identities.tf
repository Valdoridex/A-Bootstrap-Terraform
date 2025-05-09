data "azuread_client_config" "current" {}

resource "azuread_application" "Vdx-DevOps-Agent" {
  display_name = var.devops-application-name
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "SP-Vdx-DevOps-Agent" {
  client_id                    = azuread_application.Vdx-DevOps-Agent.client_id
  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal_password" "SP-Vdx-DevOps-Agent-Password" {
  service_principal_id = azuread_service_principal.SP-Vdx-DevOps-Agent.id
}
