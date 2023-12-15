resource "azurerm_virtual_network_peering" "a" {
  name = "${var.source_name}To${var.destination_name}"
  resource_group_name = var.source_resource_group_name
  virtual_network_name = var.source_virtual_network_name
  remote_virtual_network_id = var.destination_virtual_network_id 
  allow_gateway_transit = true
  allow_forwarded_traffic = true
  allow_virtual_network_access = true
}

resource "azurerm_virtual_network_peering" "b" {
  name = "${var.destination_name}To${var.source_name}"
  resource_group_name = var.destination_resource_group_name
  virtual_network_name = var.destination_virtual_network_name
  remote_virtual_network_id = var.source_virtual_network_id 
  allow_forwarded_traffic = true
  allow_virtual_network_access = true
  use_remote_gateways = true
}