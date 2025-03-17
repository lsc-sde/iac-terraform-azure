terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.88.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.6.0"
    }
  }
}

provider "azuread" {
  // tenant_id = ""
}

provider "azurerm" {
  features {}
  // tenant_id            = ""
  // subscription_id      = ""
  skip_provider_registration = true
}