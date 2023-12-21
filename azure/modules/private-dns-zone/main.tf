resource "azurerm_private_dns_zone" "main" {
  name = "privatelink.uksouth.azmk8s.io"
  resource_group_name = var.resource_group_name
   tags = merge(var.tags, {
    "Name" = "privatelink.uksouth.azmk8s.io",
    "Purpose" = "Cluster Identity"
    "TF.Type" = "azurerm_user_assigned_identity"
    "TF.Resource" = "cluster"
    "TF.Module" = "kubernetes-cluster-kubenet",
  })
}

resource "azurerm_private_dns_zone_virtual_network_link" "main" {
  name = "main"
  resource_group_name = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.main.name
  virtual_network_id = var.virtual_network_id
}


resource "azurerm_private_dns_zone_virtual_network_link" "hub" {
  count = var.enable_hub_dns ? 1 : 0
  name = "hub"
  resource_group_name = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.main.name
  virtual_network_id = var.hub_virtual_network_id
}