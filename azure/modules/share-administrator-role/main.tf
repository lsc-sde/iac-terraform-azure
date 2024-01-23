
resource "azurerm_role_definition" "main" {
  name        = "SDE Share Admin"
  scope       = data.azurerm_subscription.main.id
  description = "This role provides the data"

  permissions {
    data_actions = [ 
        "Microsoft.Storage/storageAccounts/fileServices/shares/*"
    ]
  }

  assignable_scopes = [
    data.azurerm_subscription.main.id,
  ]
}
