module "resource_group" {
  source = "../modules/resource-group"
  location = var.location
  tags = var.tags
  prefix = var.prefix
}

module "container_registry" {
  source = "../modules/container-registry"
  location = var.location
  tags = var.tags
  resource_group_name =  module.resource_group.name
  prefix = var.prefix
  key_vault_id = module.key_vault.id
  subnet_id = var.subnet_id
  hub_subscription_id = var.hub_subscription_id
  privatezone_resource_group_name = var.private_zone_resource_group_name
  subscription_id = var.subscription_id
}

module "container_registry_tasks" {
  source = "../modules/container-registry-tasks"
  container_registry_id = module.container_registry.id
  user_assigned_identity_id = module.container_registry.task_identity_id
  client_id = module.container_registry.task_client_id
  pat_token = var.pat_token
  branch_name = var.branch_name
  login_server = module.container_registry.fqdn
  tags = var.tags
}

/*
module "private_dns_zone" {
  source = "../modules/private-dns-zone"

  virtual_network_id = var.virtual_network_id
  resource_group_name = module.resource_group.name
  enable_hub_dns = var.enable_hub_dns
  hub_virtual_network_id = var.hub_virtual_network_id
  tags = var.tags
}
*/

module "key_vault" {
  source = "../modules/keyvault"
  location = var.location
  tags = var.tags
  resource_group_name = module.resource_group.name
  prefix = var.prefix
  allowed_ips = var.keyvault_allowed_ips
  k8s_admin_group = var.k8s_admin_group
  public_network_access_enabled = var.keyvault_public_network_access_enabled  
  purge_protection_enabled = var.keyvault_purge_protection_enabled
  subnet_id = var.subnet_id
  hub_subscription_id = var.hub_subscription_id
  keyvault_privatezone_enabled = true
  keyvault_privatezone_resource_group_name = var.private_zone_resource_group_name
  subscription_id = var.subscription_id
}

module "diagnostics_workspace" {
  source = "../modules/diagnostics-workspace"
  location = var.location
  tags = var.tags
  resource_group_name = module.resource_group.name
  prefix = var.prefix
}

module "storage_account" {
  source = "../modules/storage-account"
  location = var.location
  tags = var.tags
  resource_group_name = module.resource_group.name
  prefix = var.prefix
  ip_rules = var.ip_rules
  subnet_id = var.subnet_id
  azurefile_privatezone_enabled = true
  azurefile_privatezone_resource_group_name = var.private_zone_resource_group_name
  hub_subscription_id = var.hub_subscription_id
  key_vault_id = module.key_vault.id
  account_key_secret_name = "PrimaryStorageAccountKey"
  account_name_secret_name = "PrimaryStorageAccountName"
  subscription_id = var.subscription_id
}


module "kubernetes_cluster" {
  source = "../modules/kubernetes-cluster-kubenet"
  location = var.location
  tags = var.tags
  subscription_id = var.subscription_id
  resource_group_name = module.resource_group.name
  prefix = var.prefix
  key_vault_id = module.key_vault.id
  log_analytics_workspace_id = module.diagnostics_workspace.id
  log_analytics_workspace_name = module.diagnostics_workspace.name

  cluster_admin_ids = var.cluster_admin_ids
  default_node_pool_vnet_subnet_id = var.subnet_id
  container_registry_id = module.container_registry.id
  azmk8s_zone_id = "/subscriptions/${var.hub_subscription_id}/resourceGroups/${var.private_zone_resource_group_name}/providers/Microsoft.Network/privateDnsZones/privatelink.uksouth.azmk8s.io"
  resource_group_id = module.resource_group.id
  default_node_pool_vnet_id = var.virtual_network_id
  network_security_group_name = var.network_security_group_name
  network_resource_group_name = var.network_resource_group_name
  private_zone_resource_group_name = var.private_zone_resource_group_name
  apply_nsg_rules = var.apply_nsg_rules
  hub_subscription_id = var.hub_subscription_id
  defender_log_analytics_workspace_id = var.defender_log_analytics_workspace_id
  storage_account_id = module.storage_account.id
  enable_gitops = var.enable_gitops
  sku_tier = var.kubernetes_sku_tier
}

module "keda" {
  source = "../modules/kubernetes-deployment-script"
  location = var.location
  resource_group_name = module.resource_group.name
  subnet_id = var.subnet_id
  name = module.kubernetes_cluster.name
  cluster_id = module.kubernetes_cluster.id
  storage_account_name = module.storage_account.name
  tags = var.tags
  environment_name = var.environment_name
  enable_gitops = var.enable_gitops
  branch_name = var.branch_name
  flux_url = var.flux_url
}

module "sql_server" {
  source = "../modules/sql-server"
  count = var.sql_server_enabled ? 1 : 0

  location = var.location
  tags = var.tags
  resource_group_name = module.resource_group.name
  prefix = var.prefix
  subnet_id = var.subnet_id
  privatezone_resource_group_name = var.private_zone_resource_group_name
  hub_subscription_id = var.hub_subscription_id
  key_vault_id = module.key_vault.id
  subscription_id = var.subscription_id
}

module "keycloak_database" {
  source = "../modules/sql-database"
  count = var.keycloak_database_enabled ? 1 : 0

  name = "keycloak"
  location = var.location
  resource_group_name = module.resource_group.name
  sql_server_id = module.sql_server.id
  tags = var.tags
  key_vault_id = module.key_vault.id
  sku_name = var.keycloak_db_sku_name
}

module postgresql {
  # As of 19/02/2024 private endpoints are in preview on postgres flexible servers, as a result a decision 
  # has been made to provision these on the postgres single server models until the private endpoints become
  # generally available. Once they do we will need to perform a migration to the flexible servers. A module for 
  # this has been defined but as of yet not tested.
  
  source = "../modules/postgresql-single-server"

  subscription_id = var.subscription_id
  location = var.location
  resource_group_name = module.resource_group.name
  subnet_id = var.subnet_id
  tags = var.tags
  key_vault_id = module.key_vault.id
  hub_subscription_id = var.hub_subscription_id
  privatezone_resource_group_name = var.private_zone_resource_group_name
  prefix = var.prefix
}


resource "azurerm_key_vault_secret" "admin_password" {
  name         = "PatToken"
  value        = var.pat_token
  key_vault_id = module.key_vault.id
}

resource "random_bytes" "jupyter_cookie_secret" {
  length = 32
}

resource "azurerm_key_vault_secret" "jupyter_cookie_secret" {
  name         = "JupyterCookieSecret"
  value        = random_bytes.jupyter_cookie_secret.hex
  key_vault_id = module.key_vault.id
}

module jupyter_users {
  source = "../modules/entra-id-security-group"
  environment_name = var.environment_name
  purpose = "JupyterhubUsers"
  owners = var.owners
}

module jupyter_admins {
  source = "../modules/entra-id-security-group"
  environment_name = var.environment_name
  purpose = "JupyterhubAdmins"
  has_parent = true
  parent_group_object_id = module.jupyter_users.object_id
  owners = var.owners
}

module jupytersp {
  source = "../modules/entra-id-app-registration"
  environment_name = var.environment_name
  purpose = "jupyterhub"
  client_fqdn = "${var.dns_prefix}jupyter.${var.dns_zone}"
  key_vault_id = module.key_vault.id
  secret_name = "JupyterAppRegistrationClientSecret"
  owners = var.owners
  redirect_path_suffix = "/hub/oauth_callback"
}

module ohdsisp {
  source = "../modules/entra-id-app-registration"
  environment_name = var.environment_name
  purpose = "ohdsi"
  client_fqdn = "${var.dns_prefix}ohdsi.${var.dns_zone}"
  key_vault_id = module.key_vault.id
  secret_name = "OhdsiAppRegistrationClientSecret"
  owners = var.owners
  redirect_path_suffix = "/WebAPI/user/oauth/callback?client_name=OidcClient"
}

module "kubernetes_cluster_configuration" {
  source = "../../kubernetes"
  host = module.kubernetes_cluster.host
  client_certificate = module.kubernetes_cluster.client_certificate
  client_key = module.kubernetes_cluster.client_key
  cluster_ca_certificate = module.kubernetes_cluster.cluster_ca_certificate
  cluster_configuation = {
    "azure_client_id" = module.kubernetes_cluster.kubelet_identity_client_id
    "azure_keyvault_name" = module.key_vault.name
    "azure_storage_account" = module.storage_account.name
    "azure_tenant_id" = data.azurerm_client_config.current.tenant_id
    "private_dnz_zone" = var.dns_zone
    "dns_prefix" = var.dns_prefix
    "dns_resource_group" = var.private_zone_resource_group_name
    "dns_subscription_id" = var.hub_subscription_id
    "azure_subscription_id" = data.azurerm_client_config.current.subscription_id
    "azure_sql_server" = var.sql_server_enabled ? module.sql_server.name : "not-applicable"
    "azure_resource_group" = module.resource_group.name
    "azure_location" = var.location
    "postgresql_server" = module.postgresql.fqdn
    "postgresql_username" = module.postgresql.username
    "jupyterhub_client_id" = module.jupytersp.client_id
    "jupyterhub_users_role" = module.jupyter_users.object_id
    "jupyterhub_admins_role" = module.jupyter_admins.object_id
    "ohdsi_client_id" = module.ohdsisp.client_id
  }
}