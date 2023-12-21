resource "azurerm_network_interface" "main" {
  name = local.network_interface_name
  location = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    private_ip_address_allocation = "Dynamic"
    name = "default"
    subnet_id = var.subnet_id
  }

  tags = merge(var.tags, {
    "Name" = local.network_interface_name,
    "Purpose" = var.purpose
    "TF.Type" = "azurerm_network_interface"
    "TF.Resource" = "main"
    "TF.Module" = "vm-appliance",
  })
}

resource "azurerm_user_assigned_identity" "main" {
  name = local.managed_identity_name
  resource_group_name = var.resource_group_name
  location = var.location


  tags = merge(var.tags, {
    "Name" = local.name,
    "Purpose" = var.purpose
    "TF.Type" = "azurerm_virtual_machine"
    "TF.Resource" = "main"
    "TF.Module" = "vm-appliance",
  })
}

resource "azurerm_virtual_machine" "main" {
  name = local.name
  location = var.location
  resource_group_name = var.resource_group_name
  network_interface_ids = [ azurerm_network_interface.main.id ]
  vm_size = "Standard_B1s"

  storage_os_disk {
    name = local.os_disk_name
    caching = "ReadWrite"
    create_option = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  delete_os_disk_on_termination = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = var.image_publisher 
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  os_profile {
    admin_username = var.admin_username
    admin_password = var.admin_password
    computer_name = local.name
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  identity {
    type = "UserAssigned"
    identity_ids = [ azurerm_user_assigned_identity.main.id ]
  }

  tags = merge(var.tags, {
    "Name" = local.name,
    "Purpose" = var.purpose
    "TF.Type" = "azurerm_virtual_machine"
    "TF.Resource" = "main"
    "TF.Module" = "vm-appliance",
  })
}