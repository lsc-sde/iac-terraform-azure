resource "azurerm_container_registry" "main" {
  name = local.name
  location = var.location
  resource_group_name = var.resource_group_name
  admin_enabled = true
  sku = "Premium"
  public_network_access_enabled = false

  tags = merge(var.tags, {
    "TF.Type" = "azurerm_container_registry"
    "TF.Resource" = "main"
    "TF.Module" = "container-registry",
  })
}

resource "azurerm_key_vault_secret" "admin_username" {
  name         = "AcrAdminUserName"
  value        = azurerm_container_registry.main.admin_username
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "admin_password" {
  name         = "AcrAdminPassword"
  value        = azurerm_container_registry.main.admin_password
  key_vault_id = var.key_vault_id
}