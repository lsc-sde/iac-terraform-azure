resource "random_string" "username_suffix" {
  length      = 4
  special     = false
  upper       = false
  min_lower   = 2
  min_numeric = 2
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azurerm_user_assigned_identity" "main" {
  name                = "${local.name}-mi"
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = merge(var.tags, {
    "TF.Type"     = "azurerm_user_assigned_identity"
    "TF.Resource" = "main"
    "TF.Module"   = "postgresql-single-server",
  })
}

resource "azurerm_postgresql_server" "main" {
  name                   = local.name
  resource_group_name    = var.resource_group_name
  location               = var.location
  version                = var.posgresql_version
  administrator_login    = local.administrator_login
  administrator_login_password = random_password.password.result
  ssl_enforcement_enabled = true
  ssl_minimal_tls_version_enforced = "TLS1_2"
  public_network_access_enabled = false
  backup_retention_days = 35

  storage_mb = var.storage_mb

  sku_name   = var.sku_name

  tags = merge(var.tags, {
    "TF.Type"     = "azurerm_postgresql_flexible_server"
    "TF.Resource" = "main"
    "TF.Module"   = "postgresql-single-server",
  })

  

  identity {
    type = "SystemAssigned"
  }

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_private_endpoint" "main" {
  name                = "pep-${local.name}"
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = var.subnet_id
  private_service_connection {
    name                           = "psc-${local.name}"
    private_connection_resource_id = azurerm_postgresql_server.main.id
    is_manual_connection           = false
    subresource_names              = ["postgresqlServer"]
  }
  tags = merge(var.tags, {
    "TF.Type"     = "azurerm_private_endpoint"
    "TF.Resource" = "main"
    "TF.Module"   = "postgresql-single-server",
  })

  private_dns_zone_group {
    name = local.name
    private_dns_zone_ids = [
      data.azurerm_private_dns_zone.main.id,
    ]
  }
}

resource "azurerm_key_vault_secret" "password" {
  name         = "PostgresqlAdministratorPassword"
  value        = random_password.password.result
  key_vault_id = var.key_vault_id
}
