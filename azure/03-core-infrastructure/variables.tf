variable "location" {
  type = string
  description = "Location to deploy the resources"
  default = "uksouth"
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
  default = "LetMePass@135"
}

variable "virtual_network_id" {
  type = string
  description = "The id of the virtual network we're linking to"
}

variable "keyvault_allowed_ips" {
  type = list(string)
  description = "List"
  default = [ ]
}


variable "k8s_admin_group" {
  type = string
  description = "Group"
  default = "b12c915b-3f10-4e5e-baf4-91db4b7109b9" 
}

variable "keyvault_public_network_access_enabled" {
  type = bool
  description = "Allow public access to the key vault"
  default = true
}


variable "proxy_address" {
  type = string
  description = "Address of the proxy server"
  default = "" //"http://lthswproxy01.xlthtr.nhs.uk:800/"
}