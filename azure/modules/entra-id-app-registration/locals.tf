locals {
    name = "${var.environment_name} - ${var.purpose}"
    owners = distinct(concat([data.azuread_client_config.current.object_id], var.owners))
}