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
    description = "The name of the deployment script"
}

variable "subnet_id" {
    type = string
    description = "The ID of the subnet"
}

variable "enable_gitops" {
  type = bool
  description = "Enable the gitops"
}

variable "storage_account_name" {
    type = string
    description = "Storage Account Name"
}

variable tags {
    type = map(string)
    description = "List of tags to generate"
}

variable "cluster_id" {
  type = string
  description = "Id of the kubernetes cluster"
}

variable "branch_name" {
  type = string
  description = "The branch to follow on source control"
  default = "main"
}

variable "environment_name" {
  type = string
  description = "Name of the environment (in lowercase)"
}