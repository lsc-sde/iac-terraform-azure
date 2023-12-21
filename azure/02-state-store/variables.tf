variable "location" {
  type = string
  description = "Location to deploy the resources"
  default = "uksouth"
}

variable "resource_group_name" {
  type = string
  description = "resource group to deploy"
}

variable "tags" {
    type = map(string)
    description = "List of tags to generate"
    default = {
        "Environment" = "Dev",
        "Purpose" = "Terraform State"
        "Product" = "LSC SDE",
        "ManagedBy" = "Research Software Design Authority",
        "Repository" = "https://github.com/lsc-sde/k8s-iac.git"
    }
}

variable "subnet_id" {
  type = string
  description = "Id of the subnet where the cluster is to be installed"
}

variable "ip_rules" {
  type = list(string)
  description = "List of allowed IP addresses"
  default = [ "208.127.197.187" ]
}