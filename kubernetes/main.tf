module namespace {
    source = "./namespace"
    name = "lscsde"
}

module cluster_config {
    source = "./config-map"
    namespace = module.namespace.name
    name = "cluster-config"
    literals = var.cluster_configuation
}