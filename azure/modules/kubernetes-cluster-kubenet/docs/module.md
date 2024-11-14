---
title: kubernetes-cluster-kubenet
parent: Modules
grand_parent: Azure
layout: page
---

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_acr_pull"></a> [acr\_pull](#module\_acr\_pull) | ../role-assignment | n/a |
| <a name="module_acr_push"></a> [acr\_push](#module\_acr\_push) | ../role-assignment | n/a |
| <a name="module_cluster_keyvault"></a> [cluster\_keyvault](#module\_cluster\_keyvault) | ../role-assignment | n/a |
| <a name="module_cluster_kvcu"></a> [cluster\_kvcu](#module\_cluster\_kvcu) | ../role-assignment | n/a |
| <a name="module_cluster_managed_identity_operator"></a> [cluster\_managed\_identity\_operator](#module\_cluster\_managed\_identity\_operator) | ../role-assignment | n/a |
| <a name="module_cluster_network"></a> [cluster\_network](#module\_cluster\_network) | ../role-assignment | n/a |
| <a name="module_cluster_network_contributor"></a> [cluster\_network\_contributor](#module\_cluster\_network\_contributor) | ../role-assignment | n/a |
| <a name="module_cluster_pzc"></a> [cluster\_pzc](#module\_cluster\_pzc) | ../role-assignment | n/a |
| <a name="module_cluster_smb_elevated_contributor"></a> [cluster\_smb\_elevated\_contributor](#module\_cluster\_smb\_elevated\_contributor) | ../role-assignment | n/a |
| <a name="module_cluster_storage_account_contributor"></a> [cluster\_storage\_account\_contributor](#module\_cluster\_storage\_account\_contributor) | ../role-assignment | n/a |
| <a name="module_gitops_acr_pull"></a> [gitops\_acr\_pull](#module\_gitops\_acr\_pull) | ../role-assignment | n/a |
| <a name="module_gitops_acr_push"></a> [gitops\_acr\_push](#module\_gitops\_acr\_push) | ../role-assignment | n/a |
| <a name="module_kubelet_smb_elevated_contributor"></a> [kubelet\_smb\_elevated\_contributor](#module\_kubelet\_smb\_elevated\_contributor) | ../role-assignment | n/a |
| <a name="module_kubelet_storage_account_contributor"></a> [kubelet\_storage\_account\_contributor](#module\_kubelet\_storage\_account\_contributor) | ../role-assignment | n/a |
| <a name="module_kubelets_keyvault"></a> [kubelets\_keyvault](#module\_kubelets\_keyvault) | ../role-assignment | n/a |
| <a name="module_kubelets_kvcu"></a> [kubelets\_kvcu](#module\_kubelets\_kvcu) | ../role-assignment | n/a |
| <a name="module_kubelets_managed_identity_operator"></a> [kubelets\_managed\_identity\_operator](#module\_kubelets\_managed\_identity\_operator) | ../role-assignment | n/a |
| <a name="module_kubelets_network"></a> [kubelets\_network](#module\_kubelets\_network) | ../role-assignment | n/a |
| <a name="module_kubelets_network_contributor"></a> [kubelets\_network\_contributor](#module\_kubelets\_network\_contributor) | ../role-assignment | n/a |
| <a name="module_kubelets_pzc"></a> [kubelets\_pzc](#module\_kubelets\_pzc) | ../role-assignment | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_key.cluster](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_key) | resource |
| [azurerm_kubernetes_cluster.cluster](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) | resource |
| [azurerm_kubernetes_cluster_node_pool.gitops](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_node_pool) | resource |
| [azurerm_log_analytics_solution.container_insights](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_solution) | resource |
| [azurerm_network_security_rule.allow_vnetinbound](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_security_rule.https](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_role_assignment.kubelets_kvso](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_user_assigned_identity.cluster](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |
| [azurerm_user_assigned_identity.deployment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |
| [azurerm_user_assigned_identity.gitops_kubelets](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |
| [azurerm_user_assigned_identity.kubelets](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |
| [azurerm_resource_group.network_resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apply_nsg_rules"></a> [apply\_nsg\_rules](#input\_apply\_nsg\_rules) | apply NSG rules | `bool` | n/a | yes |
| <a name="input_azmk8s_zone_id"></a> [azmk8s\_zone\_id](#input\_azmk8s\_zone\_id) | id for the private zone for k8s | `string` | n/a | yes |
| <a name="input_cluster_admin_ids"></a> [cluster\_admin\_ids](#input\_cluster\_admin\_ids) | A list of groups with admin access over the cluster | `list(string)` | n/a | yes |
| <a name="input_cluster_identity_name"></a> [cluster\_identity\_name](#input\_cluster\_identity\_name) | Name of the managed identity for the cluster | `string` | `""` | no |
| <a name="input_container_registry_id"></a> [container\_registry\_id](#input\_container\_registry\_id) | Id of the container registry used by k8s | `string` | n/a | yes |
| <a name="input_default_node_pool_max_node_count"></a> [default\_node\_pool\_max\_node\_count](#input\_default\_node\_pool\_max\_node\_count) | The maximum number of nodes to provision for the default node group | `string` | `3` | no |
| <a name="input_default_node_pool_max_pods"></a> [default\_node\_pool\_max\_pods](#input\_default\_node\_pool\_max\_pods) | Maximum pods allowed on the default node pool | `number` | `110` | no |
| <a name="input_default_node_pool_min_node_count"></a> [default\_node\_pool\_min\_node\_count](#input\_default\_node\_pool\_min\_node\_count) | The min number of nodes to provision for the default node group | `string` | `1` | no |
| <a name="input_default_node_pool_vm_size"></a> [default\_node\_pool\_vm\_size](#input\_default\_node\_pool\_vm\_size) | The sku for the VM size of the default node group | `string` | `"Standard_B4ms"` | no |
| <a name="input_default_node_pool_vnet_id"></a> [default\_node\_pool\_vnet\_id](#input\_default\_node\_pool\_vnet\_id) | The id for the default node group | `string` | n/a | yes |
| <a name="input_default_node_pool_vnet_subnet_id"></a> [default\_node\_pool\_vnet\_subnet\_id](#input\_default\_node\_pool\_vnet\_subnet\_id) | The subnet id for the default node group | `string` | n/a | yes |
| <a name="input_defender_log_analytics_workspace_id"></a> [defender\_log\_analytics\_workspace\_id](#input\_defender\_log\_analytics\_workspace\_id) | ID of the log analytics workspace used by the microsoft defender configuration on k8s | `string` | n/a | yes |
| <a name="input_deployment_identity_name"></a> [deployment\_identity\_name](#input\_deployment\_identity\_name) | Name of the managed identity for the deployment | `string` | `""` | no |
| <a name="input_enable_gitops"></a> [enable\_gitops](#input\_enable\_gitops) | Enable the gitops | `bool` | n/a | yes |
| <a name="input_gitops_kubelet_identity_name"></a> [gitops\_kubelet\_identity\_name](#input\_gitops\_kubelet\_identity\_name) | Name of the managed identity for the gitops kubelets | `string` | `""` | no |
| <a name="input_gitops_node_pool_max_pods"></a> [gitops\_node\_pool\_max\_pods](#input\_gitops\_node\_pool\_max\_pods) | Maximum pods allowed on the gitops node pool | `number` | `110` | no |
| <a name="input_gitops_node_pool_vm_size"></a> [gitops\_node\_pool\_vm\_size](#input\_gitops\_node\_pool\_vm\_size) | The sku for the VM size of the default node group | `string` | `"Standard_B2ms"` | no |
| <a name="input_hub_subscription_id"></a> [hub\_subscription\_id](#input\_hub\_subscription\_id) | The ID of the hub subscription | `string` | n/a | yes |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | Id of the key vault used for KMS | `string` | n/a | yes |
| <a name="input_kms_key_name"></a> [kms\_key\_name](#input\_kms\_key\_name) | Name of the key in key vault used for KMS | `string` | `""` | no |
| <a name="input_kubelet_identity_name"></a> [kubelet\_identity\_name](#input\_kubelet\_identity\_name) | Name of the managed identity for the cluster | `string` | `""` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | Version of kubernetes to provision on the cluster | `string` | `"1.28.3"` | no |
| <a name="input_location"></a> [location](#input\_location) | The location to setup resources | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | Location for logs to be exported | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_name"></a> [log\_analytics\_workspace\_name](#input\_log\_analytics\_workspace\_name) | Name of the log analytics workspace for logs to be exported | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the cluster | `string` | `""` | no |
| <a name="input_network_cidr"></a> [network\_cidr](#input\_network\_cidr) | Network CIDR | `string` | `"100.64.0.0/16"` | no |
| <a name="input_network_resource_group_name"></a> [network\_resource\_group\_name](#input\_network\_resource\_group\_name) | Name of the network resource group | `string` | n/a | yes |
| <a name="input_network_security_group_name"></a> [network\_security\_group\_name](#input\_network\_security\_group\_name) | Name of the network security group | `string` | n/a | yes |
| <a name="input_nsg_priority_start"></a> [nsg\_priority\_start](#input\_nsg\_priority\_start) | priority for nsg to start | `number` | n/a | yes |
| <a name="input_pod_cidr"></a> [pod\_cidr](#input\_pod\_cidr) | The CIDR to assign to pods running on kubenet | `string` | `""` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Naming Prefix | `string` | `""` | no |
| <a name="input_private_zone_resource_group_name"></a> [private\_zone\_resource\_group\_name](#input\_private\_zone\_resource\_group\_name) | Name of the resource group containing the private zones | `string` | n/a | yes |
| <a name="input_proxy_address"></a> [proxy\_address](#input\_proxy\_address) | Address of the proxy server | `string` | `""` | no |
| <a name="input_proxy_exceptions"></a> [proxy\_exceptions](#input\_proxy\_exceptions) | Addresses excluded from the proxy server | `list(string)` | <pre>[<br/>  "localhost",<br/>  "127.0.0.1",<br/>  "ai.xlthtr.nhs.uk",<br/>  "172.18.16.0/24",<br/>  "172.18.17.0/24",<br/>  "10.0.0.0/16",<br/>  "10.244.0.0/16",<br/>  "168.63.129.16",<br/>  "169.254.169.254",<br/>  "dns-lander-dev.privatelink.uksouth.azmk8s.io",<br/>  "konnectivity"<br/>]</pre> | no |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | n/a | `string` | `"ID of the resource group"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group under which to build this cluster | `string` | n/a | yes |
| <a name="input_service_cidr"></a> [service\_cidr](#input\_service\_cidr) | The CIDR to assign to pods running on kubenet | `string` | `""` | no |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | The SKU Tier that should be used for this Kubernetes Cluster. Possible values are Free, Standard (which includes the Uptime SLA) and Premium. Defaults to Free. | `string` | n/a | yes |
| <a name="input_storage_account_id"></a> [storage\_account\_id](#input\_storage\_account\_id) | The ID of the storage account | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | The subscription id to deploy this to | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | List of tags to generate | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | n/a |
| <a name="output_client_key"></a> [client\_key](#output\_client\_key) | n/a |
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | n/a |
| <a name="output_deployment_identity_id"></a> [deployment\_identity\_id](#output\_deployment\_identity\_id) | n/a |
| <a name="output_host"></a> [host](#output\_host) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_kubelet_identity_client_id"></a> [kubelet\_identity\_client\_id](#output\_kubelet\_identity\_client\_id) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
<!-- END_TF_DOCS -->