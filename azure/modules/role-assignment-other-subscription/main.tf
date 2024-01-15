resource "random_uuid" "main" {

}

resource "azurerm_role_assignment" "main" {
  provider = azurerm.other_subscription
  
  name = random_uuid.main.result
  scope = var.scope
  principal_id =  var.principal_id
  role_definition_name = var.role_definition_name
  skip_service_principal_aad_check = true
}