output "id" {
    description = "ID of the diagnostics workspace"
    value = azurerm_log_analytics_workspace.main.id
}

output "workspace_id" {
    description = "Workspace ID of the diagnostics workspace"
    value = azurerm_log_analytics_workspace.main.workspace_id
}