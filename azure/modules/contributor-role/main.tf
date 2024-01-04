resource "azurerm_role_definition" "main" {
  name        = "SDE Contributor"
  scope       = data.azurerm_subscription.main.id
  description = "This role replicates the contributor role, but denies access to make changes to virtual networks"

  permissions {
    actions     = ["*"]
    not_actions = [
        "Microsoft.Authorization/*/Delete",
        "Microsoft.Authorization/*/Write",
        "Microsoft.Authorization/elevateAccess/Action",
        "Microsoft.Blueprint/blueprintAssignments/write",
        "Microsoft.Blueprint/blueprintAssignments/delete",
        "Microsoft.Compute/galleries/share/action",
        "Microsoft.Purview/consents/write",
        "Microsoft.Purview/consents/delete",
        "Microsoft.Network/*/write",
        "Microsoft.Network/*/action",
    ]
  }

  assignable_scopes = [
    data.azurerm_subscription.main.id,
  ]
}



resource "azurerm_role_assignment" "main" {
  name = "b7bca196-2729-4645-b88c-191bde9c843a"
  scope = data.azurerm_subscription.main.id
  principal_id =  var.service_principal_id
  role_definition_name = azurerm_role_definition.main.name
}