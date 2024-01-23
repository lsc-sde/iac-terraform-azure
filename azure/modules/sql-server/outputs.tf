output id {
    value = azurerm_mssql_server.main.id
    depends_on = [ 
        azurerm_private_endpoint.main 
    ]
}
