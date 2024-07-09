locals {
  name = var.name != "" ? var.name : "${var.prefix}-k8s"
  cluster_identity_name = var.cluster_identity_name != "" ? var.cluster_identity_name : "mi-${local.name}-cluster"
  deployment_identity_name = var.deployment_identity_name != "" ? var.deployment_identity_name : "mi-${local.name}-deployment"
  kubelet_identity_name = var.kubelet_identity_name != "" ? var.kubelet_identity_name : "mi-${local.name}-kubelet"
  gitops_kubelet_identity_name = var.gitops_kubelet_identity_name != "" ? var.gitops_kubelet_identity_name : "mi-${local.name}-gitops-kubelet"
  kms_key_name = var.kms_key_name != "" ? var.kms_key_name : local.name
  proxy_details = var.proxy_address != "" ? [ var.proxy_address ] : []
  pod_cidr = var.pod_cidr != "" ? var.pod_cidr : cidrsubnet(var.network_cidr, 1, 0)
  service_cidr = var.service_cidr != "" ? var.service_cidr : cidrsubnet(var.network_cidr, 1, 1)
  identity_ids = var.enable_gitops ? [ azurerm_user_assigned_identity.cluster.id, azurerm_user_assigned_identity.gitops_kubelets[0].id ] : [ azurerm_user_assigned_identity.cluster.id ]
  private_zone_resource_group_id = "/subscriptions/${var.hub_subscription_id}/resourceGroups/${var.private_zone_resource_group_name}"

  allow_https_priority = var.nsg_priority_start
  allow_https_name = local.allow_https_priority == 100 ? "https" : "https-${var.prefix}"

  allow_vnetinbound_priority = local.allow_https_priority + 1
  allow_vnetinbound_name = local.allow_vnetinbound_priority == 101 ? "Allow-VnetInBound" : "Allow-VnetInBound-${var.prefix}"
}