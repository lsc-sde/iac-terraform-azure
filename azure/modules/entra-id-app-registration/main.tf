resource "azuread_application" "main" {
  display_name = local.name
  owners       = [data.azuread_client_config.current.object_id]
  sign_in_audience = "AzureADMultipleOrgs"
  identifier_uris  = ["api://${var.environment_name}-${var.purpose}"]
  group_membership_claims = ["ApplicationGroup"]
  api {
    mapped_claims_enabled          = true
    requested_access_token_version = 2

    oauth2_permission_scope {
      admin_consent_description  = "Allow the application to access ${var.purpose} on behalf of the signed-in user."
      admin_consent_display_name = "User I"
      enabled                    = true
      id                         = "fea5ab29-3f60-4598-9746-72dbaadd6880"
      type                       = "User"
      user_consent_description   = "Allow the application to access ${var.purpose} on your behalf."
      user_consent_display_name  = "Access ${var.purpose}"
      value                      = "user_impersonation"
    }

    oauth2_permission_scope {
      admin_consent_description  = "Administer the ${var.purpose} application"
      admin_consent_display_name = "Administer"
      enabled                    = true
      id                         = "0b8668f8-ac6c-4ba7-8407-aff1d6050484"
      type                       = "Admin"
      value                      = "administer"
    }
  }

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
    redirect_uris = ["https://${var.client_fqdn}/hub/oauth_callback"]

    implicit_grant {
      access_token_issuance_enabled = true
      id_token_issuance_enabled     = true
    }
  }

  optional_claims {
    id_token {
      name = "groups"
    }
    access_token {
      name = "groups"
    }
  }

  
  required_resource_access {
    resource_app_id = "00000003-0000-0000-c000-000000000000" # Microsoft Graph

    resource_access {
      id   = "e1fe6dd8-ba31-4d61-89e7-88639da4683d" # User.Read
      type = "Scope"
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


resource "azuread_application_password" "main" {
  application_id = azuread_application.main.id
}

resource "azurerm_key_vault_secret" "main" {
  name         = var.secret_name
  value        = azuread_application_password.main.value
  key_vault_id = var.key_vault_id
}

