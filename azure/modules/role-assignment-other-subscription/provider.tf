
provider "azurerm" {
  features {}
  // tenant_id            = ""
  // subscription_id      = ""
  subscription_id = var.target_subscription_id
  resource_provider_registrations = "none" 
}

provider "azurerm" {
  alias = "other_subscription"
  subscription_id = var.subscription_id
  features {}
  resource_provider_registrations = "none" 
}