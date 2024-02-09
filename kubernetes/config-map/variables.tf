variable "namespace" {
  type = string
  description = "Namespace to deploy the resource"
}

variable "name" {
  type = string
  description = "Name of the resource to deploy"
}

variable "literals" {
  type = map(string)
  description = "Map of literal values to pass in"
}