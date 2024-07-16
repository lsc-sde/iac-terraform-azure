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

  enable_auto_scaling   = var.enable_auto_scaling
  node_count            = var.node_count
  max_pods              = var.max_pods
  vnet_subnet_id        = var.vnet_subnet_id
  enable_node_public_ip = false
  ultra_ssd_enabled     = true
  zones                 = ["1", "2", "3"]

  node_taints = var.node_taints

  node_labels = var.node_labels

  lifecycle {
    ignore_changes = [
      node_count,
    ]
  }
}