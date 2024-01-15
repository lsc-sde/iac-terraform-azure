resource "azurerm_resource_group" "main" {
  name = local.name
  location = var.location
  
  tags = merge(var.tags, {
    "TF.Type" = "azurerm_resource_group"
    "TF.Resource" = "main"
    "TF.Module" = "resource-group",
  })

  
}