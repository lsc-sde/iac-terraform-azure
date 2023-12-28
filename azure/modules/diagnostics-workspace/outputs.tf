output "id" {
    description = "ID of the diagnostics workspace"
    value = azurerm_log_analytics_workspace.main.id
}

output "name" {
    description = "name of the diagnostics workspace"
    value = azurerm_log_analytics_workspace.main.name
}

output "workspace_id" {
    description = "Workspace ID of the diagnostics workspace"
    value = azurerm_log_analytics_workspace.main.workspace_id
}