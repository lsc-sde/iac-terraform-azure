module "resource_group" {
  source = "../modules/resource-group"
  location = var.location
  tags = var.tags
  prefix = var.prefix
}

module "storage" {
  source = "../modules/storage-account"
  location = var.location
  tags = var.tags
  resource_group_name = module.resource_group.name
  subnet_id = var.subnet_id
  ip_rules = var.ip_rules
  hub_subscription_id = var.hub_subscription_id
  prefix = var.prefix
}

module "role_assignment" {
  source = "../modules/role-assignment"

  scope = module.storage.id
  principal_id = var.admin_group_id
  role_definition_name = "Storage Blob Data Contributor"
}