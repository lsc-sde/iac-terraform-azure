variable "hub_address_space" {
  type = string
  description = "Address Space of the Hub Network"
  default = "10.26.100.128/26"
}

variable "location" {
  type = string
  description = "Location to deploy the resources"
  default = "uksouth"
}

variable "prefix" {
  type = string
  description = ""
  default = "test-network"
}

variable "name" {
  type = string
  description = ""
  default = ""
}


variable "spoke_address_space" {
  type = string
  description = "Address Space of the Spoke Network"
  default = "10.26.104.0/25"
}

variable "tags" {
    type = map(string)
    description = "List of tags to generate"
    default = {
        "Environment" = "Dev",
        "Purpose" = "Test Network"
        "Product" = "LSC SDE",
        "ManagedBy" = "Research Software Design Authority",
        "Repository" = "https://github.com/lsc-sde/k8s-iac.git"
    }
}

variable "vpn_client_prefix" {
  type = string
  description = "CIDR of the VPN client space to assign"
  default = "10.0.242.0/24"
}

variable "tenant_name" {
  type = string
  description = "The name of the tenant Entra Id Tenant"
  default = "LANDERTRE.onmicrosoft.com"
}



variable "admin_password" {
  type = string
  sensitive = true
  default = "BadgerMushroom@1556"
}