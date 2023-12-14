resource "azurerm_subnet" "main" {
  name = "GatewaySubnet"
  resource_group_name = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes = [ var.gateway_subnet_prefix ]
}

resource "azurerm_public_ip" "main" {
  name                = local.ip_name
  location            = var.location
  resource_group_name = var.resource_group_name

  allocation_method = "Dynamic"
}

resource "azurerm_virtual_network_gateway" "main" {
  name = local.name
  location = var.location
  resource_group_name = var.resource_group_name
  sku = "VpnGw1"
  type = "Vpn"
  vpn_type = "RouteBased"
  ip_configuration {
    name = "vnetGatewayConfig"
    public_ip_address_id = azurerm_public_ip.main.id
    private_ip_address_allocation = "Dynamic"
    subnet_id = azurerm_subnet.main.id
  }

  vpn_client_configuration {
    address_space = [ var.vpn_client_prefix ]
  }

  tags = merge(var.tags, {
    "TF.Type" = "azurerm_virtual_network_gateway"
    "TF.Resource" = "main"
    "TF.Module" = "vpn-gateway",
  })
}