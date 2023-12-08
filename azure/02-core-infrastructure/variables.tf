variable "location" {
  type = string
  description = "Location to deploy the resources"
  default = "uksouth"
}

variable "resource_group_name" {
  type = string
  description = "resource group to deploy"
}

variable "prefix" {
  type = string
  description = ""
}

variable "tags" {
    type = map(string)
    description = "List of tags to generate"
    default = {
        "Environment" = "Dev",
        "Purpose" = "Secure Data Environment",
        "Product" = "LSC SDE",
        "ManagedBy" = "Research Software Design Authority",
        "Repository" = "https://github.com/lsc-sde/k8s-iac.git"
    }
}

variable "cluster_admin_ids" {
    type = list(string)
    description = "A list of groups with admin access over the cluster"
    default = []
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


variable "nginx_load_balancer" {
  type = string
  description = "IP adddress for NGINX Ingress Controller Internal Load Balancer"
  default     = "172.18.16.230"
}

variable "prefect_hostname" {
  type = string
  description = "Address to assign to the prefect server"
  default = "ai.xlthtr.nhs.uk"
}

variable "prefect_postgresql_password" {
  type = string
  description = "Password for the prefect postgresql server"
}

variable "network_resource_group" {
  type = string
  description = "Resource Group where the private link DNS Zone is installed"
  default = "rg-lsc-uks-tre-network"
}

variable "virtual_network_id" {
  type = string
  description = "The id of the virtual network we're linking to"
  default = "/subscriptions/4e36d23a-0f01-44f6-b3b1-54e033f2b1f1/resourceGroups/rg-lsc-uks-tre-network/providers/Microsoft.Network/virtualNetworks/vnet-lsc-uks-tre-spoke"
}