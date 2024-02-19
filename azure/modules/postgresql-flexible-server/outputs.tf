output id {
    value = azurerm_postgresql_flexible_server.main.id
    depends_on = [ 
        azurerm_private_endpoint.main,
    ]
}

output name {
    value = azurerm_postgresql_flexible_server.main.name
    depends_on = [ 
        azurerm_private_endpoint.main,
    ]
}

output username {
    value = azurerm_postgresql_flexible_server.main.administrator_login
    depends_on = [ 
        azurerm_private_endpoint.main,
    ]
}

output fqdn {
    value = azurerm_postgresql_flexible_server.main.fqdn
    depends_on = [ 
        azurerm_private_endpoint.main,
    ]
}