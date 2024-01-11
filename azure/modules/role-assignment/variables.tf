variable "scope" {
  type = string
}

variable "principal_id" {
  type = string
}

variable "role_definition_name" {
  type = string
}

variable "skip_service_principal_aad_check" {
  type = bool
  description = "Skip Service Principal AAD Check"
  default = true
}