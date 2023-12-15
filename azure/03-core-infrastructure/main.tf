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
}

module "private_dns_zone" {
  source = "../modules/private-dns-zone"

  virtual_network_id = var.virtual_network_id
  resource_group_name = module.resource_group.name
  enable_hub_dns = var.enable_hub_dns
  hub_virtual_network_id = var.hub_virtual_network_id
  tags = var.tags
}

module "key_vault" {
  source = "../modules/keyvault"
  location = var.location
  tags = var.tags
  resource_group_name = module.resource_group.name
  prefix = var.prefix
  allowed_ips = var.keyvault_allowed_ips
  k8s_admin_group = var.k8s_admin_group
  public_network_access_enabled = var.keyvault_public_network_access_enabled
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
  azurefile_privatezone_name = module.private_dns_zone.name
  azurefile_privatezone_resource_group_name = module.resource_group.name
}


module "kubernetes_cluster" {
  source = "../modules/kubernetes-cluster-kubenet"
  location = var.location
  tags = var.tags
  resource_group_name = module.resource_group.name
  prefix = var.prefix
  key_vault_id = module.key_vault.id
  log_analytics_workspace_id = module.diagnostics_workspace.id
  cluster_admin_ids = var.cluster_admin_ids
  default_node_pool_vnet_subnet_id = var.subnet_id
  container_registry_id = module.container_registry.id
  azmk8s_zone_id = module.private_dns_zone.id
  resource_group_id = module.resource_group.id
  default_node_pool_vnet_id = var.virtual_network_id
}

module "storage_account_secret" {
  source = "../modules/storage-account-secret"
  name = "secret-${module.storage_account.name}"
  namespace = "default"
  storage_account_name = module.storage_account.name
  storage_account_primary_access_key = module.storage_account.primary_access_key
 
  depends_on = [ module.kubernetes_cluster ]
}

module "keda" {
  source = "../../helm/modules/keda"
  depends_on = [ module.kubernetes_cluster ]
}

module "nginx" {
  source = "../../helm/modules/nginx"

  settings = {
    "controller.service.annotations.service\\.beta\\.kubernetes\\.io/azure-load-balancer-internal" = "true"
    "controller.service.loadBalancerIP" = var.nginx_load_balancer
    "controller.replicaCount" = "2"
 
    "controller.nodeSelector\\.kubernetes\\.io/os'" = "linux"
    "controller.image.registry" = module.container_registry.fqdn
    "controller.image.image" = "ingress-nginx/controller"
    "controller.image.tag" = "v1.2.1"
    "controller.image.digest" = ""
 
    "controller.admissionWebhooks.patch\\.nodeSelector\\.kubernetes\\.io/os" = "linux"
    "controller.admissionWebhooks.patch.image.registry" = module.container_registry.fqdn
    "controller.admissionWebhooks.patch.image.image" = "ingress-nginx/kube-webhook-certgen"
    "controller.admissionWebhooks.patch.image.tag" = "v1.1.1"
    "controller.admissionWebhooks.patch.image.digest" = ""
 
    "defaultBackend\\.nodeSelector\\.kubernetes\\.io/os" = "linux"
    "defaultBackend.image.registry" = module.container_registry.fqdn
    "defaultBackend.image.image" = "defaultbackend-amd64"
    "defaultBackend.image.tag" = "defaultbackend-amd64"
    "defaultBackend.image.digest" = ""
  }

  depends_on = [ module.kubernetes_cluster ]
}

module "prefect" {
  source = "../../helm/modules/prefect_server"

  container_registry = module.container_registry.fqdn
  hostname = var.prefect_hostname
  nginx_load_balancer = var.nginx_load_balancer
  postgresql_password = var.prefect_postgresql_password
 
  depends_on = [ module.kubernetes_cluster ]
}