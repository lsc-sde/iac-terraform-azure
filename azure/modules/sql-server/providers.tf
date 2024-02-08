

provider "azurerm" {
  features {}
  // tenant_id            = ""
  // subscription_id      = ""
  subscription_id = var.subscription_id
  skip_provider_registration = true
}

provider "azurerm" {
  alias = "hubsubscription"
  subscription_id = var.hub_subscription_id
  features {}
}