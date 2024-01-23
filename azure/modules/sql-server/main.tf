resource "random_string" "username_suffix" {
  length           = 4
  special          = false
  upper = false
  min_lower = 2
  min_numeric = 2
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}


resource "azurerm_mssql_server" "main" {
    name                         = local.name
    resource_group_name          = var.resource_group_name
    location                     = var.location
    version                      = "12.0"
    administrator_login          = local.administrator_login
    administrator_login_password = random_password.password.result

    tags = merge(var.tags, {
        "TF.Type" = "azurerm_mssql_server"
        "TF.Resource" = "main"
        "TF.Module" = "sql-server",
    })
}

resource "azurerm_private_endpoint" "main" {
  name                = "pep-${local.name}"
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = var.subnet_id
  private_service_connection {
    name                           = "psc-${local.name}"
    private_connection_resource_id = azurerm_mssql_server.main.id
    is_manual_connection           = false
    subresource_names              = ["sqlServer"]
  }
  tags = merge(var.tags, {
     "TF.Type" = "azurerm_private_endpoint"
     "TF.Resource" = "main"
     "TF.Module" = "sql-server",
  })

  private_dns_zone_group {
    name = local.name
    private_dns_zone_ids = [
      data.azurerm_private_dns_zone.main.id,
    ]
  }
}

resource "azurerm_key_vault_secret" "hostname" {
  name         = "SqlHostName"
  value        = azurerm_mssql_server.main.fully_qualified_domain_name
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "username" {
  name         = "SqlAdministratorLogin"
  value        = azurerm_mssql_server.main.administrator_login
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "password" {
  name         = "SqlAdministratorPassword"
  value        = azurerm_mssql_server.main.administrator_login_password
  key_vault_id = var.key_vault_id
}