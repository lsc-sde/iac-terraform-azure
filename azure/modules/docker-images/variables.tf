variable "container_registry_id" {
    type = string
    description = "The ID for the container registry"
}

variable "branch_name" {
  type = string
  description = "Name of the branch"
}

variable "pat_token" {
  type = string
  sensitive = true
  description = "The PAT Token for the GIT Repository"
}

variable tags {
    type = map(string)
    description = "List of tags to generate"
}