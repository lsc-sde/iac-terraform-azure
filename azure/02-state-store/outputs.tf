output "storage_account_name" {
    description = "The name of the storage account created"
    value = module.storage.name
}

output "keyvault_name" {
    description = "Name of the key vault created"
    value = module.key_vault.name
}

output "resource_group" {
  description = "Name of the resource group the storage account and keyvault will be deployed to"
  value = module.resource_group.name
}

output "subscription_id" {
  description = "Subscription id that the resources will be deployed to"
  value = data.azurerm_subscription.current.subscription_id
}

output "tenant_id" {
  description = "Tenant id that the resources will be deployed to"
  value = data.azurerm_subscription.current.tenant_id
}