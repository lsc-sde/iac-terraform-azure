variable "name" {
  type = string
  description = "Name of the secret"
}

variable "namespace" {
  type = string
  description = "Namespace to deploy the secret"
}

variable "storage_account_name" {
  type = string
  description = "Name of the storage account"
}

variable "storage_account_primary_access_key" {
  type = string
  description = "Primary access key of the storage account"
}