
provider "azurerm" {
  features {}
  // tenant_id            = ""
  // subscription_id      = ""
  skip_provider_registration = true
}

provider "azurerm" {
  alias = "other_subscription"
  subscription_id = var.subscription_id
  features {}
}