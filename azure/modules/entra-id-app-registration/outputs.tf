output "client_id" {
  value = azuread_application.main.client_id
  depends_on = [ 
    azurerm_key_vault_secret.main
    ]
}

output "object_id" {
  value = azuread_application.main.object_id
  depends_on = [ 
    azurerm_key_vault_secret.main
    ]
}