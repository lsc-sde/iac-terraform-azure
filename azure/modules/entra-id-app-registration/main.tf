resource "azuread_application" "main" {
  display_name = local.name
  owners       = [data.azuread_client_config.current.object_id]
  sign_in_audience = "AzureADMultipleOrgs"

  app_role {
    display_name = "Admin"
    id = "bf54935a-b11a-4606-b4d7-f5a7227bc7d8"
    description = "Administrators of the jupyter system"
    allowed_member_types = [ "User" ]
    value = "admin"
  }
  
  app_role {
    display_name = "User"
    id = "ecd73aeb-0d2b-4a24-871e-10885525222d"
    description = "Basic users of the jupyter system"
    allowed_member_types = [ "User" ]
    value = "user"
  }

  web {
    homepage_url  = "https://${var.client_fqdn}"
    logout_url    = "https://${var.client_fqdn}/logout"
    redirect_uris = ["https://${var.client_fqdn}/account"]

    implicit_grant {
      access_token_issuance_enabled = true
      id_token_issuance_enabled     = true
    }
  }
}

resource "azuread_service_principal" "main" {
  client_id                    = azuread_application.main.client_id
  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.current.object_id]

  feature_tags {
    enterprise = true
    gallery    = true
  }
}


resource "azuread_service_principal_password" "main" {
  service_principal_id = azuread_service_principal.main.object_id
}

resource "azurerm_key_vault_secret" "main" {
  name         = var.secret_name
  value        = azuread_service_principal_password.main.value
  key_vault_id = var.key_vault_id
}

