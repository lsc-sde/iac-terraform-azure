variable "resource_group_name" {
  type = string
  description = "The resource group to deploy the resource group to"
}

variable tags {
    type = map(string)
    description = "List of tags to generate"
}

variable "virtual_network_id" {
  type = string
  description = "The id of the virtual network we're linking to"
}

variable "enable_hub_dns" {
  type = bool
  description = "Installs the private zone dns into the hub network"
}

variable "hub_virtual_network_id" {
  type = string
  description = "The id of the hub virtual network"
}