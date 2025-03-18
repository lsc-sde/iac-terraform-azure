output "cluster_name" {
  description = "Name of the kubernetes cluster"
  value = module.kubernetes_cluster.name
}

output "cluster_resource_group" {
    description = "Name of the resource group where the kubernetes cluster is located"
    value = module.resource_group.name
}