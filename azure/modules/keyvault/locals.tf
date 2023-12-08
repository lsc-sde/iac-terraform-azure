locals {
  name = var.name != "" ? var.name : "${var.prefix}-kvlt"
  identity_name = var.identity_name != "" ? var.identity_name : "mi-${local.name}"
}