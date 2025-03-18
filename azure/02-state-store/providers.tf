terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.18.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.6.0"
    }
  }
}


provider "azurerm" {
  features {}
  subscription_id =  var.subscription_id
  resource_provider_registrations = "none" 
}

provider "random" {
  # Configuration options
}
