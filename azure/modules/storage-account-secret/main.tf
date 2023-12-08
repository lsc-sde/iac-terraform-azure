resource "kubernetes_secret" "storage" {
  metadata {
    name      = "secret-${var.storage_account_name}"
    namespace = "default"
  }

  type = "Opaque"
  data = {
    azurestorageaccountname = var.storage_account_name
    azurestorageaccountkey  = var.storage_account_primary_access_key
  }
}