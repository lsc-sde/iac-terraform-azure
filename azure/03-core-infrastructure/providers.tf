terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.84.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.6.0"
    }
  }


  //backend "azurerm" {
  //    resource_group_name  = "lsc-sde-sandbox-environment-rg"
  //    storage_account_name = "lscsdesandboxenvironment"
  //    container_name       = "tfstate"
  //    key                  = "03-core-infrastructure.tfstate"
  //    tenant_id            = "4600653f-a3c3-4253-b7b4-bef5fa774def"
  //    subscription_id      = "5bb2478d-e497-4ca1-964e-4aaa9f754a5d"
  //}
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
