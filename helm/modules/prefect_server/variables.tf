variable "container_registry" {
  type = string
  description = "Container Registry"
}

variable "nginx_load_balancer" {
  type = string
  description = "Address of the NGINX load balancer"
}

variable "hostname" {
  type = string
  description = "Address of the site"
}

variable "postgresql_password" {
  type = string
  description = "Password of postgresql server"
}