terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.88.0"
      storage_use_azuread = true
    }
    azuread = {
      source = "hashicorp/azuread"
      version = "2.47.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.6.0"
    }
  }

  
  backend "azurerm" {
      subscription_id = "f227cc66-c370-426c-ae73-24d75a8ddc4d"
      resource_group_name  = "lscsdesbxstate-rg"
      storage_account_name = "lscsdesbxstate8ddbeyve"
      container_name       = "tfstate"
      key                  = "core-infrastructure.tfstate"
  }
  
}

provider "azuread" {
  // tenant_id = ""
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
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
