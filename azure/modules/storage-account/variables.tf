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

variable "prefix" {
    type = string
    description = "Naming Prefix"
    default = ""
}

variable tags {
    type = map(string)
    description = "List of tags to generate"
}

variable "subnet_id" {
    type = string
    description = "Id for the subnet"
}

variable "ip_rules" {
  type = list(string)
  description = "List of allowed IP addresses"
}

variable "azurefile_privatezone_id" {
  type = string
  description = "id for the azure file private zone"
}