variable "resource_group_name" {
  type = string
  description = "The resource group to deploy the resource group to"
}

variable "virtual_network_id" {
  type = string
  description = "The id of the virtual network we're linking to"
}