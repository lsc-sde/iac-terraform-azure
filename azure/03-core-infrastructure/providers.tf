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

  backend "azurerm" {
      subscription_id = var.backend_subscription_id
      resource_group_name  = var.backend_resource_group_name
      storage_account_name = var.backend_storage_account_name
      container_name       = "tfstate"
      key                  = "core-infrastructure.tfstate"
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

provider "azurerm" {
  alias = "hubsubscription"
  subscription_id = var.hub_subscription_id
  features {}
}

provider "random" {
  # Configuration options
}
