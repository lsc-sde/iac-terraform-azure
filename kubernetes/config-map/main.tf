resource "kubernetes_config_map" "main" {
  metadata {
    name = var.name
  }

  data = var.literals
}