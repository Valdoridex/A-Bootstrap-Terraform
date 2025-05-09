resource "azuredevops_project" "vdx-devops-project" {
  name               = "Vdx-DevOps-${var.stack-magic-id}"
  visibility         = "private"
  description        = "Valdoridex webMethods Azure Pipleines, managed by Terraform Bootstrap stack"
  work_item_template = "Basic"
  version_control    = "Git"
}

resource "azuredevops_agent_pool" "golden-vm-creators" {
  name           = "Golden-VMs-Creator"
  auto_provision = false
  auto_update    = false
}

resource "azuredevops_variable_group" "WMUIF" {
  project_id   = azuredevops_project.vdx-devops-project.id
  name         = "WMUIF"
  description  = "webMethods Unattended Installation Framework Parameters"
  allow_access = true

  variable {
    name  = "WMUIF_TAG"
    value = "main"
  }

  variable {
    name         = "Test_Secret"
    secret_value = "somesecret"
    is_secret    = true
  }
}