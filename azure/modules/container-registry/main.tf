resource "azurerm_container_registry" "main" {
  name = local.name
  location = var.location
  resource_group_name = var.resource_group_name
  admin_enabled = true
  sku = "Premium"
  public_network_access_enabled = false

  tags = merge(var.tags, {
    "TF.Type" = "azurerm_container_registry"
    "TF.Resource" = "main"
    "TF.Module" = "container-registry",
  })
}