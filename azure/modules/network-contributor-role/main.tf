resource "azurerm_role_definition" "main" {
  name        = "SDE Network Contributor"
  scope       = data.azurerm_subscription.main.id
  description = "This role provides specific permissions for writing to the "

  permissions {
    actions     = [
        "Microsoft.Network/networkSecurityGroups/securityRules/write",
        "Microsoft.Network/privateDnsZones/write",
        "Microsoft.Network/privateEndpoints/write"
    ]
    not_actions = []
  }

  assignable_scopes = [
    data.azurerm_subscription.main.id,
  ]
}



resource "azurerm_role_assignment" "main" {
  name = "c288deaa-ed41-468b-96d4-59a7bde3e5d0"
  scope = data.azurerm_subscription.main.id
  principal_id =  var.service_principal_id
  role_definition_name = azurerm_role_definition.main.name
}