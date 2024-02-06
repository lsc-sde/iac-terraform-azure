variable "host" {
  type = string
  description = "The cluster host address for talking to the Kubernetes API"
}

variable "client_certificate" {
  type = string
  description = "Client certificate for talking to the kubernetes API"
  sensitive = true
}

variable "client_key" {
  type = string
  description = "Client key for talking to the kubernetes API"
  sensitive = true
}

variable "cluster_ca_certificate" {
  type = string
  description = "CA Certificate for talking to the kubernetes API"
  sensitive = true
}

variable "cluster_configuation" {
  type = map(string)
  description = "Map of literal values to pass in"
}