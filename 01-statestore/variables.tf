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
        "Product" = "North West SDE",
        "ManagedBy" = "Research Software Design Authority",
        "Repository" = "https://github.com/nwsde/nwsde-k8s-iac.git"
    }
}