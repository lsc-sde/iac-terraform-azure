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

variable "key_vault_id" {
  type = string
  description = "The ID of the key vault where we will store the ACR Admin Password"
}
variable "subnet_id" {
    type = string
    description = "Id for the subnet"
}

variable "hub_subscription_id" {
  type = string
  description = "The ID of the hub subscription"
}

variable "privatezone_resource_group_name" {
  type = string
  description = "resource group for the azure file private zone"
  default = ""
}

variable "subscription_id" {
  type = string 
  description = "The subscription id to deploy this to"
}