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

variable "subnet_id" {
    type = string
    description = "Id for the subnet"
}

variable "hub_subscription_id" {
  type = string
  description = "The ID of the hub subscription"
}

variable "keyvault_privatezone_resource_group_name" {
  type = string
  description = "resource group for the azure file private zone"
  default = ""
}

variable "keyvault_privatezone_enabled" {
    type = bool
    description = "Whether to create the private zone records"
    default = false
}

variable "subscription_id" {
  type = string 
  description = "The subscription id to deploy this to"
}