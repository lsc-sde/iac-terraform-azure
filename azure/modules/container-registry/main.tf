resource "azurerm_container_registry" "main" {
  name = local.name
  location = var.location
  resource_group_name = var.resource_group_name
  admin_enabled = true
  sku = "Premium"
  public_network_access_enabled = false
  network_rule_bypass_option = "AzureServices"


  identity {
    type = "UserAssigned"
    identity_ids = [ azurerm_user_assigned_identity.tasks.id ]
  }

  tags = merge(var.tags, {
    "TF.Type" = "azurerm_container_registry"
    "TF.Resource" = "main"
    "TF.Module" = "container-registry",
  })
}


resource "azurerm_private_endpoint" "main" {
  name                = "pep-${local.name}"
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = var.subnet_id
  private_service_connection {
    name                           = "psc-${local.name}"
    private_connection_resource_id = azurerm_container_registry.main.id
    is_manual_connection           = false
    subresource_names              = ["registry"]
  }

  tags = merge(var.tags, {
     "TF.Type" = "azurerm_private_endpoint"
     "TF.Resource" = "main"
     "TF.Module" = "container-registry",
  })

  private_dns_zone_group {
    name = local.name
    private_dns_zone_ids = [
      data.azurerm_private_dns_zone.frontend.id,
      data.azurerm_private_dns_zone.data.id
    ]
  }
}

resource "azurerm_key_vault_secret" "admin_username" {
  name         = "AcrAdminUserName"
  value        = azurerm_container_registry.main.admin_username
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "admin_password" {
  name         = "AcrAdminPassword"
  value        = azurerm_container_registry.main.admin_password
  key_vault_id = var.key_vault_id
}

resource "azurerm_user_assigned_identity" "tasks" {
  name                = "${local.name}-tasks"
  resource_group_name = var.resource_group_name
  location            = var.location

  tags = merge(var.tags, {
    "Name" = local.name,
    "Purpose" = "GitOps Kubelets Identity"
    "TF.Type" = "azurerm_user_assigned_identity"
    "TF.Resource" = "tasks"
    "TF.Module" = "container-registry",
  })
}


module "tasks_acr_pull" {
  source = "../role-assignment"

  scope = azurerm_container_registry.main.id
  role_definition_name = "AcrPull"
  principal_id = azurerm_user_assigned_identity.tasks.principal_id
}

module "tasks_acr_push" {
  source = "../role-assignment"

  scope = azurerm_container_registry.main.id
  role_definition_name = "AcrPush"
  principal_id = azurerm_user_assigned_identity.tasks.principal_id
}


module "tasks_contributor" {
  source = "../role-assignment"

  scope = azurerm_container_registry.main.id
  role_definition_name = "Contributor"
  principal_id = azurerm_user_assigned_identity.tasks.principal_id
}
