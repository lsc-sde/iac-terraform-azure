resource "azurerm_subnet" "main" {
  name = local.name
  address_prefixes = [ var.address_space ]
  virtual_network_name = var.virtual_network_name
  resource_group_name = var.resource_group_name

  service_endpoints = local.service_endpoints
  private_endpoint_network_policies = "Enabled"
}

resource "azurerm_network_security_group" "main" {
  name = local.name
  location = var.location
  resource_group_name = var.resource_group_name
  tags = var.tags
}

resource "azurerm_subnet_network_security_group_association" "main" {
  subnet_id                 = azurerm_subnet.main.id
  network_security_group_id = azurerm_network_security_group.main.id
}


resource "azurerm_route_table" "main" {
  name                = "${local.name}-rt"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags = var.tags
}


resource "azurerm_subnet_route_table_association" "main" {
  subnet_id      = azurerm_subnet.main.id
  route_table_id = azurerm_route_table.main.id
}