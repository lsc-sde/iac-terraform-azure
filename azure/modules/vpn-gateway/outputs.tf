output id {
    value = azurerm_virtual_network_gateway.main.id
}

output vpn_cidr {
    value = azurerm_virtual_network_gateway.main.vpn_client_configuration[0].address_space[0]
}