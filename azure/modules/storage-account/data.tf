data "azurerm_private_dns_zone" "main" {
    provider = azurerm.hubsubscription
    name = "privatelink.file.core.windows.net"
    resource_group_name = var.azurefile_privatezone_resource_group_name
}