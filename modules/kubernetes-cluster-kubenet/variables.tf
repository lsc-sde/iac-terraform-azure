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

variable "identity_name" {
    type = string
    description = "Name of the managed identity for the cluster"
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
    default = "standard_d2ads_v5"
}

variable default_node_pool_vnet_subnet_id {
    type = string
    description = "The subnet id for the default node group"
    default = "standard_d2ads_v5"
}

variable "cluster_admin_ids" {
    type = list(string)
    description = "A list of groups with admin access over the cluster"
}

variable "log_analytics_workspace_id" {
    type = string
    description = "Location for logs to be exported"
}

variable "pod_cidr" {
    type = string
    description = "The CIDR to assign to pods running on kubenet"
    default = "100.64.0.0/10" 
    
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