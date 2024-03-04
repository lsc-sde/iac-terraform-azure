locals {
    name = "${title(var.purpose)}${title(var.environment_name)}"
    owners = distinct(concat([data.azuread_client_config.current.object_id], var.owners))
}