terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.84.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.6.0"
    }
  }

/*
  backend "azurerm" {
      resource_group_name  = ""
      storage_account_name = ""
      container_name       = "tfstate"
      key                  = "prd.tfstate"
      tenant_id            = "f12f0279-8a84-4068-8322-7a6fb0f839b8"
      subscription_id      = "4e36d23a-0f01-44f6-b3b1-54e033f2b1f1"
  }
*/
}

provider "azuread" {
  // tenant_id = ""
}

provider "azurerm" {
  features {}
  // tenant_id            = ""
  // subscription_id      = ""
  skip_provider_registration = true
}

provider "random" {
  # Configuration options
}

provider "kubernetes" {
  host                   = one(data.azurerm_private_dns_a_record.k8s.records)
  client_certificate     = base64decode(module.kubernetes_cluster.client_certificate)
  client_key             = base64decode(module.kubernetes_cluster.client_key)
  cluster_ca_certificate = base64decode(module.kubernetes_cluster.cluster_ca_certificate)
  tls_server_name = data.azurerm_private_dns_a_record.k8s.fqdn
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
    host                   = one(data.azurerm_private_dns_a_record.k8s.records)
    client_certificate     = base64decode(module.kubernetes_cluster.client_certificate)
    client_key             = base64decode(module.kubernetes_cluster.client_key)
    cluster_ca_certificate = base64decode(module.kubernetes_cluster.cluster_ca_certificate)
    tls_server_name = data.azurerm_private_dns_a_record.k8s.fqdn
  }
}
