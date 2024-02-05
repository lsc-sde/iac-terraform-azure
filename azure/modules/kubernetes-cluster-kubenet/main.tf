resource "azurerm_log_analytics_solution" "container_insights" {
  solution_name         = "ContainerInsights"
  location              = var.location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = var.log_analytics_workspace_id
  workspace_name        = var.log_analytics_workspace_name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }

  tags = var.tags

}

resource "azurerm_key_vault_key" "cluster" {
  key_vault_id = var.key_vault_id
  name = local.kms_key_name
  key_type = "RSA"
  key_size = 2048

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]

  tags = var.tags

  depends_on = [ 
    module.cluster_kvcu,
    module.kubelets_kvcu,
   ]
}

resource "azurerm_user_assigned_identity" "cluster" {
  name                = local.cluster_identity_name
  resource_group_name = var.resource_group_name
  location            = var.location

  tags = merge(var.tags, {
    "Name" = local.name,
    "Purpose" = "Cluster Identity"
    "TF.Type" = "azurerm_user_assigned_identity"
    "TF.Resource" = "cluster"
    "TF.Module" = "kubernetes-cluster-kubenet",
  })
}

resource "azurerm_user_assigned_identity" "deployment" {
  name                = local.deployment_identity_name
  resource_group_name = var.resource_group_name
  location            = var.location

  tags = merge(var.tags, {
    "Name" = local.name,
    "Purpose" = "Cluster Identity"
    "TF.Type" = "azurerm_user_assigned_identity"
    "TF.Resource" = "cluster"
    "TF.Module" = "kubernetes-cluster-kubenet",
  })
}

module "cluster_kvcu" {
  source = "../role-assignment"

  scope = var.key_vault_id
  principal_id =  azurerm_user_assigned_identity.cluster.principal_id
  role_definition_name = "Key Vault Crypto User"
}

module "cluster_managed_identity_operator" {
  source = "../role-assignment"

  scope = var.resource_group_id
  principal_id =  azurerm_user_assigned_identity.cluster.principal_id
  role_definition_name = "Managed Identity Operator"
}

module "cluster_network" {
  source = "../role-assignment"

  scope = var.default_node_pool_vnet_id
  principal_id =  azurerm_user_assigned_identity.cluster.principal_id
  role_definition_name = "Network Contributor"
}

module "cluster_keyvault" {
  source = "../role-assignment"

  scope = var.key_vault_id
  principal_id =  azurerm_user_assigned_identity.cluster.principal_id
  role_definition_name = "Key Vault Contributor"
}

resource "azurerm_user_assigned_identity" "kubelets" {
  name                = local.kubelet_identity_name
  resource_group_name = var.resource_group_name
  location            = var.location

  tags = merge(var.tags, {
    "Name" = local.name,
    "Purpose" = "Kubelets Identity"
    "TF.Type" = "azurerm_user_assigned_identity"
    "TF.Resource" = "kubelets"
    "TF.Module" = "kubernetes-cluster-kubenet",
  })
}



module "cluster_network_contributor" {
  source = "../role-assignment"

  scope = data.azurerm_resource_group.network_resource_group.id
  principal_id =  azurerm_user_assigned_identity.cluster.principal_id
  role_definition_name = "Network Contributor"
}

module "kubelets_network_contributor" {
  source = "../role-assignment"

  scope = data.azurerm_resource_group.network_resource_group.id
  principal_id =  azurerm_user_assigned_identity.kubelets.principal_id
  role_definition_name = "Network Contributor"
}

module "kubelets_managed_identity_operator" {
  source = "../role-assignment"

  scope = var.resource_group_id
  principal_id =  azurerm_user_assigned_identity.kubelets.principal_id
  role_definition_name = "Managed Identity Operator"
}


resource "azurerm_role_assignment" "kubelets_kvso" {
  scope = var.key_vault_id
  principal_id =  azurerm_user_assigned_identity.kubelets.principal_id
  role_definition_name =  "Key Vault Secrets Officer"
}

module "kubelets_network" {
  source = "../role-assignment"

  scope = var.default_node_pool_vnet_id
  principal_id =  azurerm_user_assigned_identity.kubelets.principal_id
  role_definition_name = "Network Contributor"
}


module "cluster_pzc" {
  source = "../role-assignment"

  scope = var.azmk8s_zone_id
  principal_id =  azurerm_user_assigned_identity.cluster.principal_id
  role_definition_name = "Private DNS Zone Contributor"
}

module "kubelets_pzc" {
  source = "../role-assignment"

  scope = local.private_zone_resource_group_id
  principal_id =  azurerm_user_assigned_identity.kubelets.principal_id
  role_definition_name = "Private DNS Zone Contributor"
}

module "kubelets_keyvault" {
  source = "../role-assignment"

  scope = var.key_vault_id
  principal_id =  azurerm_user_assigned_identity.kubelets.principal_id
  role_definition_name = "Key Vault Contributor"
}

module "kubelets_kvcu" {
  source = "../role-assignment"

  scope = var.key_vault_id
  principal_id =  azurerm_user_assigned_identity.kubelets.principal_id
  role_definition_name = "Key Vault Crypto User"
}

resource "azurerm_kubernetes_cluster" "cluster" {
  name                = local.name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix_private_cluster = local.name
  private_cluster_enabled             = true
  private_cluster_public_fqdn_enabled = false
  private_dns_zone_id = var.azmk8s_zone_id 
  kubernetes_version = var.kubernetes_version
  role_based_access_control_enabled = true
  
  default_node_pool {
    name       = "default"
    enable_auto_scaling = true
    max_pods = var.default_node_pool_max_pods
    min_count = var.default_node_pool_min_node_count
    max_count = var.default_node_pool_max_node_count
    vm_size    = var.default_node_pool_vm_size
    vnet_subnet_id = var.default_node_pool_vnet_subnet_id
    enable_node_public_ip = false
    ultra_ssd_enabled = true
    zones = [ "1" ]
    temporary_name_for_rotation = "temppool"
    upgrade_settings {
      max_surge = "10%"
    }
  }

  identity {
    type = "UserAssigned"
    identity_ids = [
      azurerm_user_assigned_identity.cluster.id
    ]
  }

  kubelet_identity {
    user_assigned_identity_id = azurerm_user_assigned_identity.kubelets.id
    client_id = azurerm_user_assigned_identity.kubelets.client_id
    object_id = azurerm_user_assigned_identity.kubelets.principal_id
  }

  tags = merge(var.tags, {
    "Name" = local.name,
    "TF.Type" = "azurerm_kubernetes_cluster"
    "TF.Resource" = "cluster"
    "TF.Module" = "kubernetes-cluster-kubenet",
  })
  
  network_profile {
    network_plugin = "kubenet" 
    network_policy = "calico"
    pod_cidr = local.pod_cidr
    service_cidr = local.service_cidr
    dns_service_ip = cidrhost(local.service_cidr, 10)
    load_balancer_sku = "standard"
    outbound_type = "userDefinedRouting"
  }

  dynamic "http_proxy_config" {
    for_each = local.proxy_details
    content {  
      http_proxy = var.proxy_address
      https_proxy = var.proxy_address
      no_proxy = var.proxy_exceptions
    }
  }
  
  azure_active_directory_role_based_access_control {
      managed = true
      azure_rbac_enabled = true
      admin_group_object_ids = var.cluster_admin_ids
  }

  key_vault_secrets_provider {
      secret_rotation_enabled = true
  }

  open_service_mesh_enabled = true

  oms_agent {
      log_analytics_workspace_id = var.log_analytics_workspace_id
  }

  microsoft_defender {
    log_analytics_workspace_id = var.defender_log_analytics_workspace_id
  }

  azure_policy_enabled = true

  key_management_service {
    key_vault_network_access = "Private"
    key_vault_key_id = azurerm_key_vault_key.cluster.id
  }

  depends_on = [ 
    azurerm_log_analytics_solution.container_insights,
    azurerm_user_assigned_identity.kubelets,
    module.cluster_managed_identity_operator,
    module.kubelets_managed_identity_operator,
    module.cluster_network,
    module.kubelets_network,
    module.kubelets_network_contributor,
    module.cluster_network_contributor
   ]
}

module "acr_pull" {
  source = "../role-assignment"

  scope = var.container_registry_id
  role_definition_name = "AcrPull"
  principal_id = azurerm_user_assigned_identity.kubelets.principal_id
}

resource "azurerm_network_security_rule" "https" {
  count = var.apply_nsg_rules ? 1 : 0

  network_security_group_name = var.network_security_group_name
  resource_group_name = var.network_resource_group_name
  name = "https"
  priority = 100
  protocol = "Tcp"
  direction = "Inbound"
  access = "Allow"
  source_address_prefix = "*"
  source_port_range = "*"
  destination_address_prefix = "*"
  destination_port_range = "443"
}

resource "azurerm_user_assigned_identity" "github_runner_kubelets" {
  name                = local.gitrunner_kubelet_identity_name
  resource_group_name = var.resource_group_name
  location            = var.location

  tags = merge(var.tags, {
    "Name" = local.name,
    "Purpose" = "GitRunner Kubelets Identity"
    "TF.Type" = "azurerm_user_assigned_identity"
    "TF.Resource" = "github_runner_kubelets"
    "TF.Module" = "kubernetes-cluster-kubenet",
  })
}



resource "azurerm_kubernetes_cluster_node_pool" "github_runners" {
  name                  = "github"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.cluster.id
  vm_size               = var.gitrunner_node_pool_vm_size

  tags = merge(var.tags, {
    "Name" = "github",
    "Purpose" = "GitRunner Node Pool"
    "TF.Type" = "azurerm_kubernetes_cluster_node_pool"
    "TF.Resource" = "github_runners"
    "TF.Module" = "kubernetes-cluster-kubenet",
  })

  enable_auto_scaling = true
  max_pods = var.gitrunner_node_pool_max_pods
  min_count = var.gitrunner_node_pool_min_node_count
  max_count = var.gitrunner_node_pool_max_node_count
  vnet_subnet_id = var.default_node_pool_vnet_subnet_id
  enable_node_public_ip = false
  ultra_ssd_enabled = true
  zones = [ "1" ]
  
  node_taints = [
    "sdeAppType=github-runner:NoSchedule"
  ]
  
  node_labels = {
    "lsc-sde.nhs.uk/nodeType" = "github-runner"
  }

  lifecycle {
    ignore_changes = [ 
      node_count,
     ]
  }
}

module "kubelet_storage_account_contributor" {
  source = "../role-assignment"

  scope = var.storage_account_id
  principal_id =  azurerm_user_assigned_identity.kubelets.principal_id
  role_definition_name = "Contributor"
}

module "kubelet_smb_elevated_contributor" {
  source = "../role-assignment"

  scope = var.storage_account_id
  principal_id = azurerm_user_assigned_identity.kubelets.principal_id
  role_definition_name = "Storage File Data SMB Share Elevated Contributor"
}

module "cluster_storage_account_contributor" {
  source = "../role-assignment"

  scope = var.storage_account_id
  principal_id =  azurerm_user_assigned_identity.cluster.principal_id
  role_definition_name = "Contributor"
}

module "cluster_smb_elevated_contributor" {
  source = "../role-assignment"

  scope = var.storage_account_id
  principal_id = azurerm_user_assigned_identity.cluster.principal_id
  role_definition_name = "Storage File Data SMB Share Elevated Contributor"
}