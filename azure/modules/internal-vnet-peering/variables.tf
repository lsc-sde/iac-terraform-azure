variable "source_name" {
  type = string
  description = "Short name for the source network"
}

variable "source_resource_group_name" {
  type = string
  description = "The resource group name for the source network"
}

variable "source_virtual_network_name" {
  type = string
  description = "The vnet name for the source network"
}

variable "source_virtual_network_id" {
  type = string
  description = "The source network vnet id"
}

variable "destination_name" {
  type = string
  description = "Short name for the destination network"
}

variable "destination_resource_group_name" {
  type = string
  description = "The resource group name for the destination network"
}

variable "destination_virtual_network_name" {
  type = string
  description = "The vnet name for the destination network"
}

variable "destination_virtual_network_id" {
  type = string
  description = "The destination network vnet id"
}