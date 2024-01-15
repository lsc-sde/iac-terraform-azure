variable "container_registry_id" {
    type = string
    description = "The ID for the container registry"
}

variable "organisation_name" {
  type = string
  description = "Name of the organisation in github"
  default = "lsc-sde"
}

variable "repository_name" {
  type = string
  description = "Name of the repository"
}

variable "branch_name" {
  type = string
  description = "Name of the branch"
}

variable "image_name" {
  type = string
  description = "Name of the image to generate"
}

variable "folder_path" {
  type = string
  description = "Path to the docker file"
  default = "/"
}

variable "pat_token" {
  type = string
  sensitive = true
  description = "The PAT Token for the GIT Repository"
}

variable "url" {
  type = string
  description = "URL of the github repository"
  default = ""
}