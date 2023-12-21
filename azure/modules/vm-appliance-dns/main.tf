module "appliance" {
  source = "../vm-appliance"

  subnet_id = var.subnet_id
  resource_group_name = var.resource_group_name
  location = var.location
  admin_username = var.admin_username
  admin_password = var.admin_password
  purpose = var.purpose
  prefix = var.prefix
  tags = var.tags
}

resource "azurerm_virtual_machine_extension" "main" {
  name                 = "appliance-install"
  virtual_machine_id   = module.appliance.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

  settings = <<SETTINGS
 {
  "script": "${base64encode(local.bind_script)}"
 }
SETTINGS

  tags = var.tags
}

resource "azurerm_virtual_network_dns_servers" "main" {
  virtual_network_id = var.virtual_network_id
  dns_servers        = [ module.appliance.ip_address ]
  depends_on = [ 
    azurerm_virtual_machine_extension.main 
  ]
}

resource "azurerm_network_security_rule" "tcp" {
  network_security_group_name = var.network_security_group_name
  resource_group_name = var.resource_group_name
  name = "${module.appliance.name}-tcp"
  priority = 100
  protocol = "Tcp"
  direction = "Inbound"
  access = "Allow"
  source_address_prefix = "*"
  source_port_range = "*"
  destination_address_prefix = "${module.appliance.ip_address}/32"
  destination_port_range = "53"
}

resource "azurerm_network_security_rule" "udp" {
  network_security_group_name = var.network_security_group_name
  resource_group_name = var.resource_group_name
  name = "${module.appliance.name}-udp"
  priority = 101
  protocol = "Udp"
  direction = "Inbound"
  access = "Allow"
  source_address_prefix = "*"
  source_port_range = "*"
  destination_address_prefix = "${module.appliance.ip_address}/32"
  destination_port_range = "53"
}