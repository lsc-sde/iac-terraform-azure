module "resource_group" {
  source = "../modules/resource-group"
  location = var.location
  tags = var.tags
  name = var.resource_group_name
}

module "storage" {
  source = "../modules/storage-account"
  location = var.location
  tags = var.tags
  resource_group_name = module.resource_group.name
}