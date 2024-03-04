resource "azuread_group" "main" {
  display_name     = local.name
  security_enabled = true

  owners = local.owners
}

resource "azuread_group_member" "parent" {
  count = var.has_parent ? 1 : 0
  group_object_id = var.parent_group_object_id
  member_object_id = azuread_group.main.id
}