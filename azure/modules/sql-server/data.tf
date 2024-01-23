data "azurerm_private_dns_zone" "main" {
    provider = azurerm.hubsubscription
    name = "privatelink.database.windows.net"
    resource_group_name = var.privatezone_resource_group_name
}