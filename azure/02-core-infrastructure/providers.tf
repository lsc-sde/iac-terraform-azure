terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.84.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.1.2"
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
  tenant_id = "f12f0279-8a84-4068-8322-7a6fb0f839b8"
}

provider "azurerm" {
  features {}
  tenant_id            = "f12f0279-8a84-4068-8322-7a6fb0f839b8"
  subscription_id      = "4e36d23a-0f01-44f6-b3b1-54e033f2b1f1"
  skip_provider_registration = true
}

provider "random" {
  # Configuration options
}

provider "kubernetes" {
  host                   = module.kubernetes_cluster.host
  client_certificate     = base64decode(module.kubernetes_cluster.client_certificate)
  client_key             = base64decode(module.kubernetes_cluster.client_key)
  cluster_ca_certificate = base64decode(module.kubernetes_cluster.cluster_ca_certificate)
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
    host                   = module.kubernetes_cluster.host
    client_certificate     = base64decode(module.kubernetes_cluster.client_certificate)
    client_key             = base64decode(module.kubernetes_cluster.client_key)
    cluster_ca_certificate = base64decode(module.kubernetes_cluster.cluster_ca_certificate)
  }
}
