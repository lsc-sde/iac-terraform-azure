locals {
  name = var.name != "" ? var.name : "${var.prefix}-psql"
  administrator_login = "adm${random_string.username_suffix.result}"
}