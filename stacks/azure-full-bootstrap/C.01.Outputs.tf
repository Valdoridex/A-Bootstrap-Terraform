output "devops-sp-password" {
  description = "Secret for the DevOps service principal"
  value       = azuread_application_password.Vdx-DevOps-Agent-SP-Password.value
  sensitive   = true
}