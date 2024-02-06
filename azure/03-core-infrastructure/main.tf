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
}


module "kubernetes_cluster" {
  source = "../modules/kubernetes-cluster-kubenet"
  location = var.location
  tags = var.tags
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
}

module "sql_server" {
  source = "../modules/sql-server"

  location = var.location
  tags = var.tags
  resource_group_name = module.resource_group.name
  prefix = var.prefix
  subnet_id = var.subnet_id
  privatezone_resource_group_name = var.private_zone_resource_group_name
  hub_subscription_id = var.hub_subscription_id
  key_vault_id = module.key_vault.id
}

module "keycloak_database" {
  source = "../modules/sql-database"

  name = "keycloak"
  location = var.location
  resource_group_name = module.resource_group.name
  sql_server_id = module.sql_server.id
  tags = var.tags
  key_vault_id = module.key_vault.id
  sku_name = var.keycloak_db_sku_name
}


resource "azurerm_key_vault_secret" "admin_password" {
  name         = "PatToken"
  value        = var.pat_token
  key_vault_id = module.key_vault.id
}

module "kubernetes_cluster_configuration" {
  source = "../../kubernetes"
  host = module.kubernetes_cluster.host
  client_certificate = module.kubernetes_cluster.client_certificate
  client_key = module.kubernetes_cluster.client_key
  cluster_ca_certificate = module.kubernetes_cluster.cluster_ca_certificate
  cluster_configuation = {
    "AZURE_CLIENT_ID" = module.kubernetes_cluster.kubelet_identity_client_id
    "AZURE_KEYVAULT_NAME" = module.key_vault.name
    "AZURE_STORAGE_ACCOUNT" = module.storage_account.name
  }
}