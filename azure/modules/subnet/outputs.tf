output id {
    value = azurerm_subnet.main.id
}

output security_group_id {
    value = azurerm_network_security_group.main.id
}

output security_group_name {
    value = azurerm_network_security_group.main.name
}