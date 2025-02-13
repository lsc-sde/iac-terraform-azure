

provider "azurerm" {
  features {}
  // tenant_id            = ""
  // subscription_id      = ""
  subscription_id = var.subscription_id
  resource_provider_registrations = "none" 
}

provider "azurerm" {
  alias = "hubsubscription"
  subscription_id = var.hub_subscription_id
  features {}
  resource_provider_registrations = "none" 
}