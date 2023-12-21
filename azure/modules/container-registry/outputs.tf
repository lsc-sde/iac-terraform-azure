output "id" {
    description = "ID of the container registry"
    value = azurerm_container_registry.main.id
}

output "fqdn" {
  description = "FQDN of the registry"
  value =  azurerm_container_registry.main.login_server
}