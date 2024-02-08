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
    description = "Name of the cluster"
    default = ""
}

variable "cluster_identity_name" {
    type = string
    description = "Name of the managed identity for the cluster"
    default = ""
}

variable "kubelet_identity_name" {
    type = string
    description = "Name of the managed identity for the cluster"
    default = ""
}

variable "gitops_kubelet_identity_name" {
    type = string
    description = "Name of the managed identity for the gitops kubelets"
    default = ""
}

variable "deployment_identity_name" {
    type = string
    description = "Name of the managed identity for the deployment"
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


variable default_node_pool_min_node_count {
    type = string
    description = "The min number of nodes to provision for the default node group"
    default = 1
}

variable default_node_pool_max_node_count {
    type = string
    description = "The maximum number of nodes to provision for the default node group"
    default = 3
}

variable default_node_pool_vm_size {
    type = string
    description = "The sku for the VM size of the default node group"
    default = "Standard_B4ms"
}

variable default_node_pool_vnet_subnet_id {
    type = string
    description = "The subnet id for the default node group"
}

variable default_node_pool_vnet_id {
    type = string
    description = "The id for the default node group"
}

variable "cluster_admin_ids" {
    type = list(string)
    description = "A list of groups with admin access over the cluster"
}

variable "log_analytics_workspace_id" {
    type = string
    description = "Location for logs to be exported"
}

variable "log_analytics_workspace_name" {
    type = string
    description = "Name of the log analytics workspace for logs to be exported"
}

variable "network_cidr" {
  type = string
  description = "Network CIDR"
  default = "100.64.0.0/16" 
    
    /* 
        This defaults to the Carrier Grade NAT space which is unlikely to
        collide with existing CIDR ranges in the NHS.
    */
}

variable "pod_cidr" {
    type = string
    description = "The CIDR to assign to pods running on kubenet"
    default = ""
}

variable "service_cidr" {
    type = string
    description = "The CIDR to assign to pods running on kubenet"
    default = "" 
    
    /* 
        This defaults to the Carrier Grade NAT space which is unlikely to
        collide with existing CIDR ranges in the NHS.
    */
}

variable "kms_key_name" {
    type = string
    description = "Name of the key in key vault used for KMS"
    default = ""
}

variable "key_vault_id" {
    type = string
    description = "Id of the key vault used for KMS"
}

variable "kubernetes_version" {
  type = string
  description = "Version of kubernetes to provision on the cluster"
  default = "1.28.3"
}

variable "default_node_pool_max_pods" {
    type = number
    description = "Maximum pods allowed on the default node pool"
    default = 110
}

variable "proxy_address" {
  type = string
  description = "Address of the proxy server"
  default = ""
}

variable "proxy_exceptions" {
    type = list(string)
    description = "Addresses excluded from the proxy server"
    default = [
      "localhost",
      "127.0.0.1",
      "ai.xlthtr.nhs.uk",
      "172.18.16.0/24",
      "172.18.17.0/24",
      "10.0.0.0/16",
      "10.244.0.0/16",
      "168.63.129.16",
      "169.254.169.254",
      "dns-lander-dev.privatelink.uksouth.azmk8s.io",
      "konnectivity"
    ]
}

variable "container_registry_id" {
    type = string
    description = "Id of the container registry used by k8s" 
}

variable "azmk8s_zone_id" {
  type = string
  description = "id for the private zone for k8s"
}

variable "resource_group_id" {
  type = string
  default = "ID of the resource group"
}

variable "network_security_group_name" {
  type = string
  description = "Name of the network security group"
}

variable "network_resource_group_name" {
  type = string
  description = "Name of the network resource group"
}

variable "apply_nsg_rules" {
  type = bool
  description = "apply NSG rules"
}

variable "private_zone_resource_group_name" {
  type = string
  description = "Name of the resource group containing the private zones"
}

variable "hub_subscription_id" {
  type = string
  description = "The ID of the hub subscription"
}

variable "defender_log_analytics_workspace_id" {
    type = string
    nullable = true
    description = "ID of the log analytics workspace used by the microsoft defender configuration on k8s"
}

variable "enable_gitops" {
  type = bool
  description = "Enable the gitops"
}

variable gitops_node_pool_min_node_count {
    type = string
    description = "The min number of nodes to provision for the default node group"
    default = 1
}

variable gitops_node_pool_max_node_count {
    type = string
    description = "The maximum number of nodes to provision for the default node group"
    default = 3
}

variable gitops_node_pool_vm_size {
    type = string
    description = "The sku for the VM size of the default node group"
    default = "Standard_B2ms"
}

variable "gitops_node_pool_max_pods" {
    type = number
    description = "Maximum pods allowed on the gitops node pool"
    default = 110
}

variable "storage_account_id" {
  type = string
  description = "The ID of the storage account"
}

variable "subscription_id" {
  type = string 
  description = "The subscription id to deploy this to"
}