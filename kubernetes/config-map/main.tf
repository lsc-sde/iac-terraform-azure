resource "kubernetes_config_map" "main" {
  metadata {
    name = var.name
    namespace = var.namespace
  }

  data = var.literals
}