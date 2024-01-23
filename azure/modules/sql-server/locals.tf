locals {
  name = var.name != "" ? var.name : "${var.prefix}-sql"
  administrator_login = "adm${random_string.username_suffix.result}"
}