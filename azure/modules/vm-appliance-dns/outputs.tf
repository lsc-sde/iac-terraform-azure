output id {
    value = module.appliance.id
    depends_on = [ 
        azurerm_virtual_machine_extension.main,
        azurerm_virtual_network_dns_servers.main,
        azurerm_network_security_rule.tcp,
        azurerm_network_security_rule.udp
     ]
}

output ip_address {
    value = module.appliance.ip_address
}