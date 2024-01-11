variable "location" {
  type = string
  description = "Location to deploy the resources"
  default = "uksouth"
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

variable "prefix" {
  type = string
  description = "Naming prefix"
  default = "lscsandboxsde"
}

variable "hub_subscription_id" {
  type = string
  description = "The ID of the hub subscription"
}

variable "admin_group_id" {
  type = string 
  description = "id of the admin group"
}