resource "azurerm_key_vault_key" "tde" {
  name         = "sql-tde-${var.name}"
  key_vault_id = var.key_vault_id
  key_type     = "RSA"
  key_size     = 2048

  key_opts = ["unwrapKey", "wrapKey"]

  tags = merge(var.tags, {
    "TF.Type"     = "azurerm_key_vault_key"
    "TF.Resource" = "tde"
    "TF.Module"   = "sql-database",
  })
}

resource "azurerm_mssql_database" "main" {
  name                                         = var.name
  server_id                                    = var.sql_server_id
  collation                                    = "SQL_Latin1_General_CP1_CI_AS"
  sku_name                                     = var.sku_name
  transparent_data_encryption_key_vault_key_id = azurerm_key_vault_key.tde.id
  tags = merge(var.tags, {
    "TF.Type"     = "azurerm_mssql_database"
    "TF.Resource" = "main"
    "TF.Module"   = "sql-database",
  })

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}
