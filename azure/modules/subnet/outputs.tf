output id {
    value = azurerm_subnet.main.id
    depends_on = [ 
        azurerm_network_security_group.main,
        azurerm_subnet_network_security_group_association.main 
    ]
}

output security_group_id {
    value = azurerm_network_security_group.main.id
}

output security_group_name {
    value = azurerm_network_security_group.main.name
}