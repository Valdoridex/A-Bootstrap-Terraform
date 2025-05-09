data "azuread_client_config" "current" {}

resource "azuread_application" "Vdx-DevOps-Agent" {
  display_name = var.devops-application-name
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_application_registration" "Vdx-DevOps-Agent-SP" {
  display_name = var.devops-application-user-name
}

# resource "time_rotating" "example" {
#   rotation_days = 7
# }

resource "azuread_application_password" "Vdx-DevOps-Agent-SP-Password" {
  application_id = azuread_application_registration.Vdx-DevOps-Agent-SP.id
  # rotate_when_changed = {
  #   rotation = time_rotating.example.id
  # }
}