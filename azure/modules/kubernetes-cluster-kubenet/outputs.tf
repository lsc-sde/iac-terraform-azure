output "id" {
    value = azurerm_kubernetes_cluster.cluster.id

    depends_on = [ 
      azurerm_network_security_rule.https,
      azurerm_kubernetes_cluster.cluster
     ]
}

output "name" {
    value = azurerm_kubernetes_cluster.cluster.name

    depends_on = [ 
      azurerm_network_security_rule.https,
      azurerm_kubernetes_cluster.cluster
     ]
}

output "deployment_identity_id" {
    value = azurerm_user_assigned_identity.deployment.id
  
    depends_on = [ 
      azurerm_network_security_rule.https,
      azurerm_kubernetes_cluster.cluster
     ]
}

output "kubelet_identity_client_id" {
    value = azurerm_user_assigned_identity.kubelets.client_id
  
    depends_on = [ 
      azurerm_network_security_rule.https,
      azurerm_kubernetes_cluster.cluster
     ]
}

output "host" {
    value = azurerm_kubernetes_cluster.cluster.kube_admin_config.0.host

    depends_on = [ 
      azurerm_network_security_rule.https,
      azurerm_kubernetes_cluster.cluster
     ]
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.cluster.kube_admin_config.0.client_certificate
  sensitive = true
}

output "client_key" {
  value = azurerm_kubernetes_cluster.cluster.kube_admin_config.0.client_key
  sensitive = true
}

output "cluster_ca_certificate" {
  value = azurerm_kubernetes_cluster.cluster.kube_admin_config.0.cluster_ca_certificate
  sensitive = true
}