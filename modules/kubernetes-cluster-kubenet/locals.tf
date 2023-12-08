locals {
  name = var.name != "" ? var.name : "${var.prefix}-k8s"
  identity_name = var.identity_name != "" ? var.identity_name : "mi-${local.name}"
  kms_key_name = var.kms_key_name != "" ? var.kms_key_name : local.name
}