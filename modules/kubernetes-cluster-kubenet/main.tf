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
}

resource "azurerm_user_assigned_identity" "cluster" {
  name                = local.identity_name
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

resource "azurerm_user_assigned_identity" "kubelets" {
  name                = local.identity_name
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

resource "azurerm_kubernetes_cluster" "cluster" {
  name                = local.name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = local.name

  default_node_pool {
    name       = "default"
    enable_auto_scaling = true
    min_count = var.default_node_pool_min_node_count
    max_count = var.default_node_pool_max_node_count
    vm_size    = var.default_node_pool_vm_size
    vnet_subnet_id = var.default_node_pool_vnet_subnet_id
  }

  identity {
    type = "UserAssigned"
    identity_ids = [
        {
            "${azurerm_user_assigned_identity.cluster.id}" : {}
        }
    ]
  }

  kubelet_identity {
    user_assigned_identity_id = azurerm_user_assigned_identity.kubelets.id
  }

  tags = merge(var.tags, {
    "Name" = local.name,
    "TF.Type" = "azurerm_kubernetes_cluster"
    "TF.Resource" = "cluster"
    "TF.Module" = "kubernetes-cluster-kubenet",
  })
  
  network_profile {
    network_plugin = "kubenet" 
    network_policy = "azure"
    pod_cidr = var.pod_cidr
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
}