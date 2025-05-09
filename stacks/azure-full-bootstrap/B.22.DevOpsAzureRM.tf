resource "azuredevops_serviceendpoint_azurerm" "devops-arm-service-endpoint" {
  project_id                             = azuredevops_project.vdx-devops-project.id
  service_endpoint_name                  = "Vdx DevOps AzureRM"
  description                            = "Managed by Terraform"
  service_endpoint_authentication_scheme = "ServicePrincipal"
  credentials {
    serviceprincipalid  = azuread_service_principal.SP-Vdx-DevOps-Agent.object_id
    serviceprincipalkey = azuread_service_principal_password.SP-Vdx-DevOps-Agent-Password.value
  }
  azurerm_spn_tenantid      = var.tenant-id
  azurerm_subscription_id   = var.subscription-id
  azurerm_subscription_name = "Valdoridex subscription"
}