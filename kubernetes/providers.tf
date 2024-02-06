terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.25.2"
    }
  }
}

provider "kubernetes" {
  # Configuration options
  host = var.host
  client_key = base64encode(var.client_key)
  client_certificate = base64encode(var.client_certificate)
  cluster_ca_certificate = base64encode(var.cluster_ca_certificate)
}