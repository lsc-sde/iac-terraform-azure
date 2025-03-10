variable "location" {
  type = string
  description = "Location to deploy the resources"
  default = "uksouth"
}

variable "prefix" {
  type = string
  description = "Naming prefix"
  default = "lscsandboxsde"
}

variable "kubernetes_sku_tier" {
  type = string
  description = "The SKU Tier that should be used for this Kubernetes Cluster. Possible values are Free, Standard (which includes the Uptime SLA) and Premium. Defaults to Free."
  default = "Free"
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
    default = [
      "1fff09c5-0c5d-42e7-b3b6-e60f5b445de6"
    ]
}

variable "subnet_id" {
  type = string
  description = "Id of the subnet where the cluster is to be installed"
  default = "/subscriptions/5bb2478d-e497-4ca1-964e-4aaa9f754a5d/resourceGroups/test-network-spoke-network-rg/providers/Microsoft.Network/virtualNetworks/test-network-spoke-network-vnet/subnets/test-network-spoke-network-subnet"
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
  default = "/subscriptions/5bb2478d-e497-4ca1-964e-4aaa9f754a5d/resourceGroups/test-network-spoke-network-rg/providers/Microsoft.Network/virtualNetworks/test-network-spoke-network-vnet"
}

variable "hub_virtual_network_id" {
  type = string
  description = "The id of the hub virtual network we're linking to"
  default = "/subscriptions/de97be38-945e-4824-a44b-5b101c0e048b/resourceGroups/rg-icb-uks-plt-network/providers/Microsoft.Network/virtualNetworks/vnet-icb-uks-plt-azFirewall"
}

variable "keyvault_allowed_ips" {
  type = list(string)
  description = "List"
  default = [ ]
}


variable "k8s_admin_group" {
  type = string
  description = "Group"
  default = "1fff09c5-0c5d-42e7-b3b6-e60f5b445de6" 
}

variable "keyvault_public_network_access_enabled" {
  type = bool
  description = "Allow public access to the key vault"
  default = false
}


variable "proxy_address" {
  type = string
  description = "Address of the proxy server"
  default = "" //"http://lthswproxy01.xlthtr.nhs.uk:800/"
}

variable "enable_hub_dns" {
  type = bool
  description = "Installs the private zone dns into the hub network"
  default = true
}

variable "network_resource_group_name" {
  type = string
  description = "Name of the network resource group"
  default = "test-network-spoke-network-rg"
}

variable "network_security_group_name" {
  type = string
  description = "Name of the network security group"
  default = "test-network-spoke-network-subnet"
}

variable "hub_subscription_id" {
  type = string
  description = "The ID of the hub subscription"
  default = "5bb2478d-e497-4ca1-964e-4aaa9f754a5d"
}

variable "subscription_id" {
  type = string
  description = "The ID of the hub subscription"
  default = "5bb2478d-e497-4ca1-964e-4aaa9f754a5d"
}

variable "private_zone_resource_group_name" {
  type = string
  description = "Name of the resource group containing the private zones"
  default = ""
}

variable "apply_nsg_rules" {
  type = bool
  description = "apply NSG rules"
  default = true
}

variable "environment_name" {
  type = string
  description = "Name of the environment (in lowercase)"
  default = "sandbox"
}


variable "keyvault_purge_protection_enabled" {
  type = bool
  description = "Enable Purge protection"
  default = false
}

variable "defender_log_analytics_workspace_id" {
    type = string
    nullable = true
    description = "ID of the log analytics workspace used by the microsoft defender configuration on k8s"
    default = null
}

variable "keycloak_db_sku_name" {
  type = string
  description = "Name of the SKU for the keycloak database"
  default = "S0"
}

variable "enable_gitops" {
  type = bool
  description = "Enable the gitops"
  default = true
}

variable "pat_token" {
  type = string
  description = "THE PAT_TOKEN used to open the repositories"
  sensitive = true
}

variable "branch_name" {
  type = string
  description = "The branch to follow on source control"
  default = "main"
}

variable "dns_prefix" {
  type = string
  description = "The prefix for any DNS records on the private DNS"
}

variable "dns_zone" {
  type = string
  description = "The DNS zone for any DNS records on private DNS" 
}

variable "owners" {
  type = list(string)
  description = "A list of object ID's for users that will own (and therefore be able to manage) any Entra ID objects"
}

variable "flux_url" {
  type = string
  description = "The URL of the flux repository used to configure the environment"
  default = "https://github.com/lsc-sde/iac-flux-lscsde"
}

variable "sql_server_enabled" {
  type = bool
  description = "Provision an SQL Server"
  default = false
}

variable "keycloak_database_enabled" {
  type = bool
  description = "Provision an Keycloak database"
  default = false
}

variable "kubernetes_nsg_priority_start" {
  type = number
  description = "priority id for kubernetes nsg to start"
  default = 100
}

variable "kubernetes_version" {
  type = string
  description = "The kubernetes version to install onto the cluster"
  default = "1.28.10"
}

variable "datascience_large_nodepool_vm_size" {
  type = string
  description = "VM Sku for the large datascience node pools"
  default = "Standard_E8as_v5"
}

variable "gpu_nodepool_vm_size" {
  type        = string
  description = "VM Sku for the GPU node pools"
  default     = "Standard_NC6s_v3"
}