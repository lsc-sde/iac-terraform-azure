output "name" {
  value = kubernetes_config_map.main.metadata[0].name
}