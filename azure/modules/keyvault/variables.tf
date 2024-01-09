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
    default = ""
}

variable "identity_name" {
    type = string
    description = "Name of the managed identity for the cluster"
    default = ""
}

variable "prefix" {
    type = string
    description = "Naming Prefix"
    default = ""
}

variable tags {
    type = map(string)
    description = "List of tags to generate"
}

variable "allowed_ips" {
  type = list(string)
  description = "List of IP's that can talk to key vault"
}

variable "k8s_admin_group" {
  type = string
  description = "Group"
}

variable "public_network_access_enabled" {
  type = bool
  description = "Allow public access to the key vault"
}

variable "purge_protection_enabled" {
  type = bool
  description = "Enable Purge protection"
}