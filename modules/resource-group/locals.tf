locals {
  name = var.name != "" ? var.name : "${var.prefix}-rg"
}