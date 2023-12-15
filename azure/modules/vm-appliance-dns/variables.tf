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

variable "subnet_id" {
  type = string
  description = "Id of the subnet"
}

variable "purpose" {
  type = string
  description = "Brief description of the purpose of this VM"
}

variable "admin_username" {
  type = string
  default = "lsc-admin"
}

variable "admin_password" {
  type = string
  sensitive = true
}