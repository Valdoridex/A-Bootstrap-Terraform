resource "azuredevops_project" "project" {
  name        = "Vdx-DevOps-${var.stack-magic-id}"
  description = "Valdoridex DevOps Project"
}