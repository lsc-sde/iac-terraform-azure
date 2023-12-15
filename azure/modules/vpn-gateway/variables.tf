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

variable "gateway_subnet_prefix" {
  type = string
  description = "CIDR of the Address space to assign"
}

variable "vpn_client_prefix" {
  type = string
  description = "CIDR of the VPN client space to assign"
}

variable "virtual_network_name" {
  type = string
  description = "Name of the virtual network"
}

variable "tenant_name" {
  type = string
  description = "The name of the tenant Entra Id Tenant"
}

variable "spoke_address_space" {
  type = string
  description = "Address space for the spoke network"
}