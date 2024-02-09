
provider "azurerm" {
  features {}
  // tenant_id            = ""
  // subscription_id      = ""
  skip_provider_registration = true
  subscription_id = var.target_subscription_id
}

provider "azurerm" {
  alias = "other_subscription"
  subscription_id = var.subscription_id
  features {}
}