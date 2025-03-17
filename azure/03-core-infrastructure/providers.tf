terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.18.0"
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
  resource_provider_registrations = "none" 
}

provider "azurerm" {
  alias = "hubsubscription"
  subscription_id = var.hub_subscription_id
  features {}
  resource_provider_registrations = "none" 
}

provider "random" {
  # Configuration options
}
