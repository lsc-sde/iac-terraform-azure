module "resource_group" {
  source = "../modules/resource-group"
  location = var.location
  tags = var.tags
  prefix = var.prefix
}

resource "random_string" "name" {
  length = 5
  upper = false
  special = false
  lower = true
  numeric = true
}

module "key_vault" {
  source = "../modules/keyvault"

  subnet_id = var.subnet_id
  subscription_id = data.azurerm_subscription.current.subscription_id
  allowed_ips = []
  hub_subscription_id = data.azurerm_subscription.current.subscription_id
  
  prefix = random_string.name.result
  k8s_admin_group = data.azurerm_client_config.current.object_id
  public_network_access_enabled = false
  purge_protection_enabled = false
  keyvault_privatezone_enabled = true
  keyvault_privatezone_resource_group_name = var.private_zone_resource_group_name
  resource_group_name = module.resource_group.name
  tags = var.tags
  location = var.location
}

module "storage" {
  source = "../modules/storage-account"
  location = var.location
  tags = var.tags
  resource_group_name = module.resource_group.name
  subnet_id = var.subnet_id
  ip_rules = var.ip_rules
  hub_subscription_id = var.hub_subscription_id
  prefix = random_string.name.result
  key_vault_id = module.key_vault.id
  account_name_secret_name = "StorageAccountName"
  account_key_secret_name = "StorageAccountKey"
  subscription_id = data.azurerm_subscription.current.subscription_id
}

module "role_assignment" {
  source = "../modules/role-assignment"

  scope = module.storage.id
  principal_id = var.admin_group_id
  role_definition_name = "Storage Blob Data Contributor"
  skip_service_principal_aad_check = false
}