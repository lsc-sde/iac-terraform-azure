resource "azurerm_private_dns_zone" "azurefile" {
  name = "privatelink.file.core.windows.net"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "azurefile" {
  name = "azurefile"
  resource_group_name = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.azurefile.name
  virtual_network_id = var.virtual_network_id
}

resource "azurerm_private_dns_zone" "azmk8s" {
  name = "privatelink.uksouth.azmk8s.io"
  resource_group_name = var.resource_group_name
}


resource "azurerm_private_dns_zone_virtual_network_link" "azmk8s" {
  name = "azmk8s"
  resource_group_name = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.azmk8s.name
  virtual_network_id = var.virtual_network_id
}