resource "azurerm_kubernetes_cluster_extension" "flux" {
  name           = "flux"
  cluster_id     = var.cluster_id
  extension_type = "microsoft.flux"
}

resource "azurerm_kubernetes_flux_configuration" "certmanager" {
  name       = "cert-manager"
  cluster_id = var.cluster_id
  namespace  = "cert-manager"
  scope = "cluster"

  git_repository {
    url             = "https://github.com/lsc-sde/iac-flux-certmanager.git"
    reference_type  = "branch"
    reference_value = var.branch_name
    sync_interval_in_seconds = 60
    timeout_in_seconds = 600
  }

  kustomizations {
    name = "cert-manager"
    sync_interval_in_seconds = 60
    retry_interval_in_seconds = 60
    timeout_in_seconds = 600
    path = "clusters/${var.environment_name}"
  }

  depends_on = [
    azurerm_kubernetes_cluster_extension.flux
  ]
}

resource "azurerm_kubernetes_flux_configuration" "keda" {
  name       = "keda"
  cluster_id = var.cluster_id
  namespace  = "keda"
  scope = "cluster"

  git_repository {
    url             = "https://github.com/lsc-sde/iac-flux-keda"
    reference_type  = "branch"
    reference_value = var.branch_name
    sync_interval_in_seconds = 60
    timeout_in_seconds = 600
  }

  kustomizations {
    name = "keda"
    sync_interval_in_seconds = 60
    retry_interval_in_seconds = 60
    timeout_in_seconds = 600
  }

  depends_on = [
    azurerm_kubernetes_cluster_extension.flux
  ]
}



resource "azurerm_kubernetes_flux_configuration" "nginx" {
  name       = "nginx"
  cluster_id = var.cluster_id
  namespace  = "nginx"
  scope = "cluster"

  git_repository {
    url             = "https://github.com/lsc-sde/iac-flux-nginx"
    reference_type  = "branch"
    reference_value = var.branch_name
    sync_interval_in_seconds = 60
    timeout_in_seconds = 600
  }

  kustomizations {
    name = "nginx"
    sync_interval_in_seconds = 60
    retry_interval_in_seconds = 60
    timeout_in_seconds = 600
  }

  depends_on = [
    azurerm_kubernetes_cluster_extension.flux
  ]
}



resource "azurerm_kubernetes_flux_configuration" "prefect_server" {
  name       = "prefect-server"
  cluster_id = var.cluster_id
  namespace  = "prefect"
  scope = "namespace"

  git_repository {
    url             = "https://github.com/lsc-sde/iac-flux-prefect-server"
    reference_type  = "branch"
    reference_value = var.branch_name
    sync_interval_in_seconds = 60
    timeout_in_seconds = 600
  }

  kustomizations {
    name = "prefect-server"
    sync_interval_in_seconds = 60
    retry_interval_in_seconds = 60
    timeout_in_seconds = 600
  }

  depends_on = [
    azurerm_kubernetes_cluster_extension.flux
  ]
}