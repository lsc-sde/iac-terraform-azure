locals {
  name = var.name != "" ? var.name : "${var.prefix}-subnet"
  service_endpoints = var.default_service_endpoints ? concat(var.custom_service_endpoints, [ "Microsoft.ContainerRegistry", "Microsoft.KeyVault", "Microsoft.Storage" ]) : var.custom_service_endpoints
}