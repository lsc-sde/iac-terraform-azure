output "id" {
    description = "ID of the container registry"
    value = azurerm_container_registry.main.id
}

output "fqdn" {
  description = "FQDN of the registry"
  value =  azurerm_container_registry.main.login_server
}

output "task_identity_id" {
  description = "Id of the managed identity to be used by tasks"
  value = azurerm_user_assigned_identity.tasks.id
  depends_on = [
    module.tasks_acr_pull,
    module.tasks_acr_push,
    module.tasks_contributor,
  ]
}
output "task_client_id" {
  description = "Client Id of the managed identity to be used by tasks"
  value = azurerm_user_assigned_identity.tasks.client_id
  depends_on = [
    module.tasks_acr_pull,
    module.tasks_acr_push,
    module.tasks_contributor,
  ]
}