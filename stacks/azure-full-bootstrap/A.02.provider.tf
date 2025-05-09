terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.27"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 3.3.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  subscription_id = var.subscription-id
  features {}
}

# Configure the Azure Active Directory Provider
provider "azuread" {
  tenant_id = var.tenant-id
}