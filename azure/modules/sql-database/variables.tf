variable "location" {
    type = string
    description = "The location to setup resources"
}

variable "resource_group_name" {
    type = string
    description = "The name of the resource group under which to build this cluster"
}

variable "name" {
    type = string
    description = "Name of the cluster"
}

variable tags {
    type = map(string)
    description = "List of tags to generate"
}

variable "sql_server_id" {
  type = string
  description = "ID for the SQL Server that this belongs to"
}

variable "sku_name" {
  type = string
  description = "Name of the SKU"
}

variable "key_vault_id" {
  type = string
  description = "The ID of the key vault to add the secret to"
}