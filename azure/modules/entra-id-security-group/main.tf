resource "azuread_group" "main" {
  display_name     = local.name
  security_enabled = true

  owners = [
    data.azuread_client_config.current.object_id,
  ]
}