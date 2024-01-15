locals {
    url = var.url != "" ? var.url : "https://github.com/${var.organisation_name}/${var.repository_name}"
}