output "id" {
    description = "ID of the container registry"
    value = azurerm_container_registry.main.id

    depends_on = [ azurerm_container_registry_agent_pool.main ]
}

output "fqdn" {
  description = "FQDN of the registry"
  value =  azurerm_container_registry.main.login_server
}