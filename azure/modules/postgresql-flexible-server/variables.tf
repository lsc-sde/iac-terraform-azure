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

variable "prefix" {
    type = string
    description = "Naming Prefix"
    default = ""
}

variable tags {
    type = map(string)
    description = "List of tags to generate"
}

variable "subnet_id" {
    type = string
    description = "Id for the subnet"
}

variable "hub_subscription_id" {
  type = string
  description = "The ID of the hub subscription"
}

variable "privatezone_resource_group_name" {
  type = string
  description = "resource group for the azure file private zone"
}

variable "key_vault_id" {
  type = string
  description = "The ID of the key vault to add the secret to"
}

variable "subscription_id" {
  type = string 
  description = "The subscription id to deploy this to"
}

variable "version" {
  type = string
  description = "Version of postgresql to use"
  default = "12"
}

variable "zone" {
  type = string
  description = "which zone to provision this on"
  default = "1"
}

variable "sku_name" {
  type = string
  description = "(Optional) The SKU Name for the PostgreSQL Flexible Server. The name of the SKU, follows the tier + name pattern (e.g. B_Standard_B1ms, GP_Standard_D2s_v3, MO_Standard_E4s_v3)."
  default = "B_Standard_B1ms"  
}

variable "storage_mb" {
  type = number
  description = "(Optional) The max storage allowed for the PostgreSQL Flexible Server. Possible values are 32768, 65536, 131072, 262144, 524288, 1048576, 2097152, 4193280, 4194304, 8388608, 16777216 and 33553408"
  default = 32768
}

variable "tenant_id" {
  type = string
  description = "The tenant which to setup against"
}

variable "databases" {
  type = list(string)
  description = "Name of databases to create"
}