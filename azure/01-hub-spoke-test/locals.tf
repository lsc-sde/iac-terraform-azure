locals {
  name = var.name != "" ? var.name : "${var.prefix}-rg"
  vpn_subnet = cidrsubnet(var.hub_address_space, 1, 0)
  hub_subnet = cidrsubnet(var.hub_address_space, 1, 1)
}