resource "random_string" "name" {
  length = 22 - length(local.name)
  upper = false
  special = false
  lower = true
  numeric = true
}

resource "azurerm_storage_account" "main" {
    name = "${local.name}${random_string.name.result}"
    resource_group_name = var.resource_group_name
    location = var.location

    account_tier = "Standard"  
    account_replication_type = "ZRS"
    public_network_access_enabled = false
    allow_nested_items_to_be_public = false
    shared_access_key_enabled  = false
    
    tags = merge(var.tags, {
        "TF.Type" = "azurerm_storage_account"
        "TF.Resource" = "main"
        "TF.Module" = "storage-account",
    })

    network_rules {
        default_action = "Allow"
        ip_rules = var.ip_rules

        virtual_network_subnet_ids = [
            var.subnet_id
        ]
    }

    
}

resource "azurerm_private_endpoint" "main" {
  name                = "pep-${local.name}"
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = var.subnet_id
  private_service_connection {
    name                           = "psc-${local.name}"
    private_connection_resource_id = azurerm_storage_account.main.id
    is_manual_connection           = false
    subresource_names              = ["file"]
  }
  tags = merge(var.tags, {
     "TF.Type" = "azurerm_private_endpoint"
     "TF.Resource" = "main"
     "TF.Module" = "storage-account",
  })

  private_dns_zone_group {
    name = local.name
    private_dns_zone_ids = [
      data.azurerm_private_dns_zone.main.id,
    ]
  }
}

resource "azurerm_key_vault_secret" "main" {
  name         = var.account_key_secret_name
  value        = azurerm_storage_account.main.primary_access_key
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "storage_account_name" {
  name         = var.account_name_secret_name
  value        = azurerm_storage_account.main.name
  key_vault_id = var.key_vault_id
}