resource "azurerm_kubernetes_cluster_node_pool" "node_pool" {
  name                  = var.name
  kubernetes_cluster_id = var.cluster_id
  vm_size               = var.vm_size

  tags = merge(var.tags, {
    "Name"        = var.name,
    "Purpose"     = var.purpose
    "TF.Type"     = "azurerm_kubernetes_cluster_node_pool"
    "TF.Resource" = "node_pool"
    "TF.Module"   = "kubernetes-node-pool",
  })

  auto_scaling_enabled   = var.enable_auto_scaling
  node_count            = var.node_count
  min_count             = var.min_count
  max_count             = var.max_count
  max_pods              = var.max_pods
  vnet_subnet_id        = var.vnet_subnet_id
  node_public_ip_enabled = false
  ultra_ssd_enabled     = true
  zones                 = ["1", "2", "3"]

  node_taints = var.node_taints

  node_labels = var.node_labels

  priority = var.priority

  lifecycle {
    ignore_changes = [
      node_count,
    ]
  }
}
