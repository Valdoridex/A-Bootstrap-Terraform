output "devops-sp-password" {
  description = "Secret for the DevOps service principal"
  value       = azuread_service_principal_password.SP-Vdx-DevOps-Agent-Password.value
  sensitive   = true
}