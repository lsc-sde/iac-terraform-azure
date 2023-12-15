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
  
  custom_route {
    address_prefixes = [ var.spoke_address_space ]
  }
  
  ip_configuration {
    name = "vnetGatewayConfig"
    public_ip_address_id = azurerm_public_ip.main.id
    private_ip_address_allocation = "Dynamic"
    subnet_id = azurerm_subnet.main.id
  }

  vpn_client_configuration {
    address_space = [ var.vpn_client_prefix ]
    

    vpn_auth_types = [ "AAD" ]
    vpn_client_protocols = [ "OpenVPN"  ]

    // Azure Public
    aad_tenant = "https://login.microsoftonline.com/${data.azurerm_client_config.current.tenant_id}"
    aad_audience = "41b23e61-6c1e-4545-b367-cd054e0ed4b4"
    aad_issuer = "https://sts.windows.net/${data.azurerm_client_config.current.tenant_id}/"
  }


  tags = merge(var.tags, {
    "TF.Type" = "azurerm_virtual_network_gateway"
    "TF.Resource" = "main"
    "TF.Module" = "vpn-gateway",
  })
}