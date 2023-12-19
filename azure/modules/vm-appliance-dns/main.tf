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


  tags = {
    environment = "Production"
  }
}

resource "azurerm_virtual_network_dns_servers" "main" {
  virtual_network_id = var.virtual_network_id
  dns_servers        = [ module.appliance.ip_address ]
}