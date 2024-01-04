resource "azurerm_role_definition" "main" {
  name        = "SDE User Access Administrator"
  scope       = data.azurerm_subscription.main.id
  description = "This role creates a user access administrator that can assign and revoke roles to other users, but cannot create custom roles definitions"

  permissions {
    actions     = [ 
      "*/read",
      "Microsoft.Authorization/locks/*",
      "Microsoft.Authorization/roleAssignments/*",
      "Microsoft.Support/*"
    ]
    not_actions = [
    ]
  }

  assignable_scopes = [
    data.azurerm_subscription.main.id,
  ]
}

resource "azurerm_role_assignment" "main" {
  name = "27d0b7bc-5173-4d4b-8e9e-95747f5e32c7"
  scope = data.azurerm_subscription.main.id
  principal_id =  var.service_principal_id
  role_definition_name = azurerm_role_definition.main.name
  condition_version = "2.0"
  condition = <<-EOM
(
 (
  !(ActionMatches{'Microsoft.Authorization/roleAssignments/write'})
 )
 OR
 (
  @Request[Microsoft.Authorization/roleAssignments:RoleDefinitionId] ForAnyOfAnyValues:GuidEquals {${local.assignable_role_ids}}
 )
)
EOM
}