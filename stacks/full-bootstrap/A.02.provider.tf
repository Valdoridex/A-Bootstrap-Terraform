terraform {
  required_version = ">= 1.0"
  required_providers {
    azure = {
      source  = "hashicorp/azurerm"
      version = ">= 4.27"
    }
  }
}
