resource "azurerm_user_assigned_identity" "keyVault" {
  name                = local.identity_name
  resource_group_name = var.resource_group_name
  location            = var.location
}

resource "azurerm_key_vault" "keyVault" {
  name                        = local.name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = var.public_network_access_enabled
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = var.purge_protection_enabled
  public_network_access_enabled = var.public_network_access_enabled
  enable_rbac_authorization = true

  sku_name = "standard"

  tags = merge(var.tags, {
    "TF.Type" = "azurerm_key_vault"
    "TF.Resource" = "keyVault"
    "TF.Module" = "keyvault",
  })

  network_acls {
    bypass = var.public_network_access_enabled ? "AzureServices" : "None"
    default_action = "Allow"
    ip_rules = var.allowed_ips
  }

  access_policy {
      tenant_id = data.azurerm_client_config.current.tenant_id
      object_id = var.k8s_admin_group 
      key_permissions = [ "Backup", "Create", "Decrypt", "Delete", "Encrypt", "Get", "Import", "List", "Purge", "Recover", "Restore", "Sign", "UnwrapKey", "Update", "Verify", "WrapKey", "Release", "Rotate", "GetRotationPolicy","SetRotationPolicy" ]
      secret_permissions = [ "Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"]
      certificate_permissions = [ "Backup", "Create", "Delete", "DeleteIssuers", "Get", "GetIssuers", "Import", "List", "ListIssuers", "ManageContacts", "ManageIssuers", "Purge", "Recover", "Restore", "SetIssuers", "Update"]
  }
}


resource "azurerm_role_assignment" "k8s_admin_group" {
  scope = azurerm_key_vault.keyVault.id
  principal_id = var.k8s_admin_group
  role_definition_name =  "Key Vault Data Access Administrator"
}

resource "azurerm_role_assignment" "k8s_admin_group_kvco" {
  scope = azurerm_key_vault.keyVault.id
  principal_id = var.k8s_admin_group
  role_definition_name =  "Key Vault Crypto Officer"
}



resource "azurerm_private_endpoint" "keyVault" {
  name                = "pep-${local.name}"
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = var.subnet_id
  private_service_connection {
    name                           = "psc-${local.name}"
    private_connection_resource_id = azurerm_key_vault.keyVault.id
    is_manual_connection           = false
    subresource_names              = ["vault"]
  }
  tags = merge(var.tags, {
     "TF.Type" = "azurerm_private_endpoint"
     "TF.Resource" = "keyVault"
     "TF.Module" = "keyvault",
  })

}


resource "azurerm_private_dns_a_record" "keyVault" {
  provider = azurerm.hubsubscription

  count = var.keyvault_privatezone_enabled ? 1 : 0
  name                = azurerm_key_vault.keyVault.name
  zone_name           = "privatelink.vaultcore.azure.net"
  resource_group_name = var.keyvault_privatezone_resource_group_name
  ttl                 = 300
  records             = [
    azurerm_private_endpoint.keyVault.private_service_connection.0.private_ip_address
  ]

  tags = merge(var.tags, {
     "TF.Type" = "azurerm_private_dns_a_record"
     "TF.Resource" = "keyVault"
     "TF.Module" = "keyvault",
  })
}