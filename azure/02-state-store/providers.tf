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

/*
  backend "azurerm" {
      resource_group_name  = ""
      storage_account_name = ""
      container_name       = "tfstate"
      key                  = "prd.tfstate"
      tenant_id            = "f12f0279-8a84-4068-8322-7a6fb0f839b8"
      subscription_id      = ""
  }
*/
}


provider "azurerm" {
  features {}
  tenant_id            = "f12f0279-8a84-4068-8322-7a6fb0f839b8"
  subscription_id      = ""
}

provider "random" {
  # Configuration options
}
