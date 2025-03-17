variable "hub_address_space" {
  type = string
  description = "Address Space of the Hub Network"
}

variable "location" {
  type = string
  description = "Location to deploy the resources"
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
}

variable "tenant_name" {
  type = string
  description = "The name of the tenant Entra Id Tenant"
}

variable "admin_password" {
  type = string
  sensitive = true
}

variable "service_principal_id" {
  type = string
  description = "The object ID of the service principal that is going to be used to apply the terraform to" 
}

variable "private_dns_zone_name" {
  type = string
  description = "The private DNS zone that will be used for the endpoints"
}