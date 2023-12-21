locals {
  name = var.name != "" ? var.name : "${var.prefix}-vpngw"
  ip_name = var.name != "" ? var.name : "${var.prefix}-vpngw-ip"
}