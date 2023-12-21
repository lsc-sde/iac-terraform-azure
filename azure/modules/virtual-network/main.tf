resource "azurerm_virtual_network" "main" {
  name = local.name
  location = var.location
  resource_group_name = var.resource_group_name
  address_space = [ var.address_space ]

  tags = merge(var.tags, {
    "TF.Type" = "azurerm_virtual_network"
    "TF.Resource" = "main"
    "TF.Module" = "virtual-network",
  })
}