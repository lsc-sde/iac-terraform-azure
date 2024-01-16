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


resource "azurerm_private_endpoint" "main" {
  name                = "pep-${local.name}"
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = var.subnet_id
  private_service_connection {
    name                           = "psc-${local.name}"
    private_connection_resource_id = azurerm_container_registry.main.id
    is_manual_connection           = false
    subresource_names              = ["registry"]
  }

  tags = merge(var.tags, {
     "TF.Type" = "azurerm_private_endpoint"
     "TF.Resource" = "main"
     "TF.Module" = "container-registry",
  })

}


resource "azurerm_private_dns_a_record" "main" {
  provider = azurerm.hubsubscription

  name                = azurerm_container_registry.main.name
  zone_name           = "privatelink.azurecr.io"
  resource_group_name = var.privatezone_resource_group_name
  ttl                 = 300
  records             = [
    azurerm_private_endpoint.main.private_service_connection.0.private_ip_address
  ]

  tags = merge(var.tags, {
     "TF.Type" = "azurerm_private_dns_a_record"
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