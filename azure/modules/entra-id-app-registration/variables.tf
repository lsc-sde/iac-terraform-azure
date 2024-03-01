variable "environment_name" {
    type = string
    description = "The environment name for the App Registration Name"
}

variable "purpose" {
    type = string
    description = "Purpose of the App Registration"
}

variable "client_fqdn" {
    type = string
    description = "The Fully qualified domain name of the client application"
}

variable "key_vault_id" {
  type = string
  description = "The ID of the key vault to add the secret to"
}

variable "secret_name" {
  type = string
  description = "Name of the secret in azure key vault"
}