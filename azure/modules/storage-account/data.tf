data "azurerm_private_dns_zone" "file" {
    provider = azurerm.hubsubscription
    name = "privatelink.file.core.windows.net"
    resource_group_name = var.azurefile_privatezone_resource_group_name
}

data "azurerm_private_dns_zone" "blob" {
    provider = azurerm.hubsubscription
    name = "privatelink.blob.core.windows.net"
    resource_group_name = var.azurefile_privatezone_resource_group_name
}

