locals {
  name = var.name != "" ? var.name : "${var.prefix}-psqlf"
  administrator_login = "adm${random_string.username_suffix.result}"
}