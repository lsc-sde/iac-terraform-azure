variable "location" {
    type = string
    description = "The location to setup resources"
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

variable "resource_group_name" {
  type = string
  description = "Name of the resource group"
}

variable "address_space" {
  type = string
  description = "CIDR of the Address space to assign"
}

variable "virtual_network_name" {
  type = string
  description = "Name of the Virtual Network to install the subnet"
}

variable "default_service_endpoints" {
  type = bool
  description = "Whether to enable the default endpoints: Container Registry, Storage Account and Key Vault"
  default = false
}

variable "custom_service_endpoints" {
  type = list(string)
  description = "List of service endpoints to apply"
  default = []
}