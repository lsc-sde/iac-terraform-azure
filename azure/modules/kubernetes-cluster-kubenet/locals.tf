locals {
  name = var.name != "" ? var.name : "${var.prefix}-k8s"
  cluster_identity_name = var.cluster_identity_name != "" ? var.cluster_identity_name : "mi-${local.name}-cluster"
  kubelet_identity_name = var.kubelet_identity_name != "" ? var.kubelet_identity_name : "mi-${local.name}-kubelet"
  kms_key_name = var.kms_key_name != "" ? var.kms_key_name : local.name
  proxy_details = var.proxy_address != "" ? [ var.proxy_address ] : []
}