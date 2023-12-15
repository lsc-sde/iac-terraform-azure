data "azurerm_private_dns_a_record" "k8s" {
  name                = module.kubernetes_cluster.name
  zone_name           = module.private_dns_zone.name
  resource_group_name = module.resource_group.name
}