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

}

resource "azurerm_private_dns_a_record" "main" {
  provider = azurerm.hubsubscription

  count = var.azurefile_privatezone_enabled ? 1 : 0
  name                = azurerm_storage_account.main.name
  zone_name           = "privatelink.file.core.windows.net"
  resource_group_name = var.azurefile_privatezone_resource_group_name
  ttl                 = 300
  records             = [
    azurerm_private_endpoint.main.private_service_connection.0.private_ip_address
  ]

  tags = merge(var.tags, {
     "TF.Type" = "azurerm_private_dns_a_record"
     "TF.Resource" = "main"
     "TF.Module" = "storage-account",
  })
}