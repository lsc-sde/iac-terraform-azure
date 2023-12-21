locals {
  name = var.name != "" ? var.name : "${var.prefix}acr"
  identity_name = var.identity_name != "" ? var.identity_name : "mi-${local.name}"
}