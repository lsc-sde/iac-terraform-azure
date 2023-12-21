resource "helm_release" "prefect-server" {
  name             = "prefect-server"
  repository       = "https://prefecthq.github.io/prefect-helm/"
  chart            = "prefect-server"
  namespace        = "prefect"
  create_namespace = true
  cleanup_on_fail  = true
  force_update     = true
  recreate_pods    = false
  lint             = true
  timeout          = 300
  wait             = true

  set {
    name = "server.image.repository"
    value = "${var.container_registry}/prefecthq/prefect"
  }

  set {
    name = "server.image.prefectTag"
    value = "2.8.6-python3.11"
  }

  set {
    name = "server.env[0].name"
    value = "PREFECT_API_URL" 
  }

  set {
    name = "server.env[0].value"
    value = "http://${var.nginx_load_balancer}:4200/api"
  }

  set {
    name = "server.resources.requests.cpu"
    value = "100m"
  }

  set {
    name = "server.resources.requests.memory"
    value = "512Mi"
  }

  set {
    name = "server.resources.limits.cpu"
    value = "1000m"
  }

  set {
    name = "server.resources.limits.memory"
    value = "2Gi"
  }

  set {
    name = "service.type"
    value = "LoadBalancer"
  }

  set {
    name = "service.port"
    value = "4200"
  }

  set {
    name = "service.externalTrafficPolicy"
    value = "Cluster"
  }

  set {
    name = "service.annotations.service\\.beta\\.kubernetes\\.io/azure-load-balancer-internal"
    value = "true"
  }

  set {
    name = "ingress.enabled"
    value = "true"
  }

  set {
    name = "ingress.className"
    value = "nginx"
  }

  set {
    name = "ingress.host.hostname"
    value = var.hostname
  }

  set {
    name = "ingress.host.path"
    value = "/prefect"
  }

  set {
    name = "ingress.host.pathType"
    value = "Prefix"
  }

  set {
    name = "ingress.annotations.nginx\\.ingress\\.kubernetes\\.io/ssl-redirect"
    value = "false"
  }

  set {
    name = "postgresql.enabled"
    value = "true"
  }

  set {
    name = "postgresql.auth.password"
    value = var.postgresql_password
  }
}
