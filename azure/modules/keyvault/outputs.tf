output id {
    value = azurerm_key_vault.keyVault.id
    depends_on = [ 
        azurerm_role_assignment.k8s_admin_group,
        azurerm_role_assignment.k8s_admin_group_kvco,
        azurerm_private_endpoint.keyVault,
        azurerm_private_dns_a_record.keyVault
     ]
}