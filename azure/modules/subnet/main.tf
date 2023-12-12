resource "azurerm_subnet" "main" {
  name = local.name
  address_prefixes = [ var.address_space ]
  virtual_network_name = var.virtual_network_name
  resource_group_name = var.resource_group_name

  service_endpoints = local.service_endpoints
}