data "azurerm_client_config" "current" {}

data "azurerm_private_dns_zone" "main" {
    provider = azurerm.hubsubscription
    name = "privatelink.vaultcore.azure.net"
    resource_group_name = var.keyvault_privatezone_resource_group_name
}