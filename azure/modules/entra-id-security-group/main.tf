resource "azuread_group" "main" {
  display_name     = local.name
  security_enabled = true
  types            = ["Unified"]

  owners = [
    data.azuread_client_config.current.object_id,
  ]
}