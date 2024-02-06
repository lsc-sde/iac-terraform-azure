variable "container_registry_id" {
    type = string
    description = "ID of the container registry"
}

variable "user_assigned_identity_id" {
    type = string
    description = "ID of the user managed identity used"
}

variable "client_id" {
    type = string
    description = "Client ID of the user managed identity used"
}

variable "pat_token" {
    type = string
    description = "PAT TOKEN to use when talking to the repositories"
    sensitive = true
}

variable "branch_name" {
  type = string
  description = "The branch to follow on source control"
}

variable "login_server" {
  type = string
  description = "The FQDN of the ACR registry"
}

variable "run_now" {
  type = bool
  description = "Run the tasks now"
  default = false
}

variable "tags" {
    type = map(string)
    description = "List of tags to generate"
}
