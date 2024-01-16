data "azurerm_private_dns_zone" "frontend" {
    provider = azurerm.hubsubscription
    name = "privatelink.azurecr.io"
    resource_group_name = var.privatezone_resource_group_name
}

data "azurerm_private_dns_zone" "data" {
    provider = azurerm.hubsubscription
    name = "privatelink.uksouth.data.azurecr.io"
    resource_group_name = var.privatezone_resource_group_name
}