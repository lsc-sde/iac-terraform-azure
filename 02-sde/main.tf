module "resource_group" {
  source = "../modules/resource-group"
  location = var.location
  tags = var.tags
  name = var.resource_group_name
}