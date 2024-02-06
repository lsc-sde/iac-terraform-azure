output id {
    value = azurerm_mssql_server.main.id
    depends_on = [ 
        azurerm_private_endpoint.main,
        module.sql_server_kvcu
    ]
}

output name {
    value = azurerm_mssql_server.main.name
    depends_on = [ 
        azurerm_private_endpoint.main,
        module.sql_server_kvcu
    ]
}
