locals {
  tags = merge(var.tags, {
    stack_name = "azure-full-bootstrap"
  })
}

data "azurerm_client_config" "current" {}
