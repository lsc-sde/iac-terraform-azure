resource "helm_release" "nginx_ingress" {
  name             = "nginx-ingress"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  version          = "4.0.6"
  namespace        = "ingress-nginx"
  create_namespace = true
  cleanup_on_fail  = true
  force_update     = true
  recreate_pods    = false
  lint             = true
  timeout          = 300
  wait             = true

  dynamic "set" {
    for_each = var.settings

    content {    
        name = set.key
        value = set.value
    }
  }
}
