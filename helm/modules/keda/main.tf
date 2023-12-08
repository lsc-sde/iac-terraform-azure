resource "helm_release" "keda" {
  name             = "keda"
  repository       = "https://kedacore.github.io/charts"
  chart            = "keda"
  namespace        = "keda"
  create_namespace = true
  cleanup_on_fail  = true
  force_update     = true
  recreate_pods    = false
  lint             = true
  timeout          = 300
  wait             = true
}
