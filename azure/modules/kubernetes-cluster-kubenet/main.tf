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
    azurerm_role_assignment.cluster_kvcu,
    azurerm_role_assignment.kubelets_kvcu,
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

resource "azurerm_role_assignment" "cluster" {
  name = "a11590e0-f117-4028-8430-a52663a53118"
  scope = var.azmk8s_zone_id
  principal_id =  azurerm_user_assigned_identity.cluster.principal_id
  role_definition_name = "Contributor"
}



resource "azurerm_role_assignment" "cluster_kvcu" {
  name = "3f3a3113-8be6-4451-a12c-82107ca4e0bc"
  scope = var.key_vault_id
  principal_id =  azurerm_user_assigned_identity.cluster.principal_id
  role_definition_name = "Key Vault Crypto User"
}

resource "azurerm_role_assignment" "cluster_managed_identity_operator" {
  name = "a3411728-c492-447b-97d5-25549a2e11c9"
  scope = var.resource_group_id
  principal_id =  azurerm_user_assigned_identity.cluster.principal_id
  role_definition_name = "Managed Identity Operator"
}

resource "azurerm_role_assignment" "cluster_network" {
  name = "7d23c9c8-be44-4c9b-bea8-60a2c4f7a59a"
  scope = var.default_node_pool_vnet_id
  principal_id =  azurerm_user_assigned_identity.cluster.principal_id
  role_definition_name = "Network Contributor"
}

resource "azurerm_role_assignment" "cluster_keyvault" {
  name = "0cb5292e-3e8a-4435-8717-43c841c28a58"
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

resource "azurerm_role_assignment" "kubelets" {
  name = "4e48e760-4c83-42b5-bd0e-21f724c6ca27"
  scope = var.azmk8s_zone_id
  principal_id =  azurerm_user_assigned_identity.kubelets.principal_id
  role_definition_name = "Contributor"
}

resource "azurerm_role_assignment" "kubelets_managed_identity_operator" {
  name = "81025c61-5a56-42bd-ab77-73901477c73c"
  scope = var.resource_group_id
  principal_id =  azurerm_user_assigned_identity.kubelets.principal_id
  role_definition_name = "Managed Identity Operator"
}

resource "azurerm_role_assignment" "kubelets_network" {
  name = "939a823f-22d2-41dd-8a11-a6d3fe4e338f"
  scope = var.default_node_pool_vnet_id
  principal_id =  azurerm_user_assigned_identity.kubelets.principal_id
  role_definition_name = "Network Contributor"
}


resource "azurerm_role_assignment" "cluster_pzc" {
  name = "6d271502-a49d-47f8-85a1-34014873f92a"
  scope = var.azmk8s_zone_id
  principal_id =  azurerm_user_assigned_identity.cluster.principal_id
  role_definition_name = "Private DNS Zone Contributor"
}

resource "azurerm_role_assignment" "kubelets_pzc" {
  name = "584e313c-768c-41af-bce1-e2eb5f6e1645"
  scope = var.azmk8s_zone_id
  principal_id =  azurerm_user_assigned_identity.kubelets.principal_id
  role_definition_name = "Private DNS Zone Contributor"
}

resource "azurerm_role_assignment" "kubelets_keyvault" {
  name = "c5d56270-6718-4c33-9454-86fc771fecfa"
  scope = var.key_vault_id
  principal_id =  azurerm_user_assigned_identity.kubelets.principal_id
  role_definition_name = "Key Vault Contributor"
}

resource "azurerm_role_assignment" "kubelets_kvcu" {
  name = "5dcbef66-27ec-4a5e-8a61-b32278d02dc1"
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
  azure_policy_enabled = true

  key_management_service {
    key_vault_network_access = "Private"
    key_vault_key_id = azurerm_key_vault_key.cluster.id
  }

  depends_on = [ 
    azurerm_log_analytics_solution.container_insights,
    azurerm_role_assignment.cluster,
    azurerm_user_assigned_identity.kubelets,
    azurerm_role_assignment.cluster_managed_identity_operator,
    azurerm_role_assignment.kubelets_managed_identity_operator,
    azurerm_role_assignment.cluster_network,
    azurerm_role_assignment.kubelets_network
   ]
}

resource "azurerm_role_assignment" "acr_pull" {
  scope = var.container_registry_id
  role_definition_name = "AcrPull"
  principal_id = azurerm_user_assigned_identity.kubelets.principal_id
  skip_service_principal_aad_check = true
}

resource "azurerm_network_security_rule" "https" {
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