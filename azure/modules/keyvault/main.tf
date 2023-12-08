resource "azurerm_user_assigned_identity" "keyVault" {
  name                = local.identity_name
  resource_group_name = var.resource_group_name
  location            = var.location
}

resource "azurerm_key_vault" "keyVault" {
  name                        = local.name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  public_network_access_enabled = false

  sku_name = "standard"

  tags = merge(var.tags, {
    "TF.Type" = "azurerm_key_vault"
    "TF.Resource" = "keyVault"
    "TF.Module" = "keyvault",
  })
}