---
title: Terraform Documents
parent: Azure
grand_parent: Terraform
layout: page
---

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | 2.47.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.88.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.88.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_container_registry"></a> [container\_registry](#module\_container\_registry) | ../modules/container-registry | n/a |
| <a name="module_container_registry_tasks"></a> [container\_registry\_tasks](#module\_container\_registry\_tasks) | ../modules/container-registry-tasks | n/a |
| <a name="module_datascience_large_nodepool"></a> [datascience\_large\_nodepool](#module\_datascience\_large\_nodepool) | ../modules/kubernetes-node-pool | n/a |
| <a name="module_diagnostics_workspace"></a> [diagnostics\_workspace](#module\_diagnostics\_workspace) | ../modules/diagnostics-workspace | n/a |
| <a name="module_jupyter_admins"></a> [jupyter\_admins](#module\_jupyter\_admins) | ../modules/entra-id-security-group | n/a |
| <a name="module_jupyter_users"></a> [jupyter\_users](#module\_jupyter\_users) | ../modules/entra-id-security-group | n/a |
| <a name="module_jupytersp"></a> [jupytersp](#module\_jupytersp) | ../modules/entra-id-app-registration | n/a |
| <a name="module_keda"></a> [keda](#module\_keda) | ../modules/kubernetes-deployment-script | n/a |
| <a name="module_key_vault"></a> [key\_vault](#module\_key\_vault) | ../modules/keyvault | n/a |
| <a name="module_keycloak_database"></a> [keycloak\_database](#module\_keycloak\_database) | ../modules/sql-database | n/a |
| <a name="module_kubernetes_cluster"></a> [kubernetes\_cluster](#module\_kubernetes\_cluster) | ../modules/kubernetes-cluster-kubenet | n/a |
| <a name="module_kubernetes_cluster_configuration"></a> [kubernetes\_cluster\_configuration](#module\_kubernetes\_cluster\_configuration) | ../../kubernetes | n/a |
| <a name="module_ohdsisp"></a> [ohdsisp](#module\_ohdsisp) | ../modules/entra-id-app-registration | n/a |
| <a name="module_postgresql"></a> [postgresql](#module\_postgresql) | ../modules/postgresql-single-server | n/a |
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | ../modules/resource-group | n/a |
| <a name="module_sql_server"></a> [sql\_server](#module\_sql\_server) | ../modules/sql-server | n/a |
| <a name="module_storage_account"></a> [storage\_account](#module\_storage\_account) | ../modules/storage-account | n/a |
| <a name="module_supersetsp"></a> [supersetsp](#module\_supersetsp) | ../modules/entra-id-app-registration | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_secret.admin_password](https://registry.terraform.io/providers/hashicorp/azurerm/3.88.0/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.jupyter_cookie_secret](https://registry.terraform.io/providers/hashicorp/azurerm/3.88.0/docs/resources/key_vault_secret) | resource |
| [random_bytes.jupyter_cookie_secret](https://registry.terraform.io/providers/hashicorp/random/3.6.0/docs/resources/bytes) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.88.0/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apply_nsg_rules"></a> [apply\_nsg\_rules](#input\_apply\_nsg\_rules) | apply NSG rules | `bool` | `true` | no |
| <a name="input_branch_name"></a> [branch\_name](#input\_branch\_name) | The branch to follow on source control | `string` | `"main"` | no |
| <a name="input_cluster_admin_ids"></a> [cluster\_admin\_ids](#input\_cluster\_admin\_ids) | A list of groups with admin access over the cluster | `list(string)` | <pre>[<br/>  "1fff09c5-0c5d-42e7-b3b6-e60f5b445de6"<br/>]</pre> | no |
| <a name="input_datascience_large_nodepool_vm_size"></a> [datascience\_large\_nodepool\_vm\_size](#input\_datascience\_large\_nodepool\_vm\_size) | VM Sku for the large datascience node pools | `string` | `"Standard_E8as_v5"` | no |
| <a name="input_defender_log_analytics_workspace_id"></a> [defender\_log\_analytics\_workspace\_id](#input\_defender\_log\_analytics\_workspace\_id) | ID of the log analytics workspace used by the microsoft defender configuration on k8s | `string` | `null` | no |
| <a name="input_dns_prefix"></a> [dns\_prefix](#input\_dns\_prefix) | The prefix for any DNS records on the private DNS | `string` | n/a | yes |
| <a name="input_dns_zone"></a> [dns\_zone](#input\_dns\_zone) | The DNS zone for any DNS records on private DNS | `string` | n/a | yes |
| <a name="input_enable_gitops"></a> [enable\_gitops](#input\_enable\_gitops) | Enable the gitops | `bool` | `true` | no |
| <a name="input_enable_hub_dns"></a> [enable\_hub\_dns](#input\_enable\_hub\_dns) | Installs the private zone dns into the hub network | `bool` | `true` | no |
| <a name="input_environment_name"></a> [environment\_name](#input\_environment\_name) | Name of the environment (in lowercase) | `string` | `"sandbox"` | no |
| <a name="input_flux_url"></a> [flux\_url](#input\_flux\_url) | The URL of the flux repository used to configure the environment | `string` | `"https://github.com/lsc-sde/iac-flux-lscsde"` | no |
| <a name="input_hub_subscription_id"></a> [hub\_subscription\_id](#input\_hub\_subscription\_id) | The ID of the hub subscription | `string` | `"5bb2478d-e497-4ca1-964e-4aaa9f754a5d"` | no |
| <a name="input_hub_virtual_network_id"></a> [hub\_virtual\_network\_id](#input\_hub\_virtual\_network\_id) | The id of the hub virtual network we're linking to | `string` | `"/subscriptions/de97be38-945e-4824-a44b-5b101c0e048b/resourceGroups/rg-icb-uks-plt-network/providers/Microsoft.Network/virtualNetworks/vnet-icb-uks-plt-azFirewall"` | no |
| <a name="input_ip_rules"></a> [ip\_rules](#input\_ip\_rules) | List of allowed IP addresses | `list(string)` | <pre>[<br/>  "208.127.197.187"<br/>]</pre> | no |
| <a name="input_k8s_admin_group"></a> [k8s\_admin\_group](#input\_k8s\_admin\_group) | Group | `string` | `"1fff09c5-0c5d-42e7-b3b6-e60f5b445de6"` | no |
| <a name="input_keycloak_database_enabled"></a> [keycloak\_database\_enabled](#input\_keycloak\_database\_enabled) | Provision an Keycloak database | `bool` | `false` | no |
| <a name="input_keycloak_db_sku_name"></a> [keycloak\_db\_sku\_name](#input\_keycloak\_db\_sku\_name) | Name of the SKU for the keycloak database | `string` | `"S0"` | no |
| <a name="input_keyvault_allowed_ips"></a> [keyvault\_allowed\_ips](#input\_keyvault\_allowed\_ips) | List | `list(string)` | `[]` | no |
| <a name="input_keyvault_public_network_access_enabled"></a> [keyvault\_public\_network\_access\_enabled](#input\_keyvault\_public\_network\_access\_enabled) | Allow public access to the key vault | `bool` | `false` | no |
| <a name="input_keyvault_purge_protection_enabled"></a> [keyvault\_purge\_protection\_enabled](#input\_keyvault\_purge\_protection\_enabled) | Enable Purge protection | `bool` | `false` | no |
| <a name="input_kubernetes_nsg_priority_start"></a> [kubernetes\_nsg\_priority\_start](#input\_kubernetes\_nsg\_priority\_start) | priority id for kubernetes nsg to start | `number` | `100` | no |
| <a name="input_kubernetes_sku_tier"></a> [kubernetes\_sku\_tier](#input\_kubernetes\_sku\_tier) | The SKU Tier that should be used for this Kubernetes Cluster. Possible values are Free, Standard (which includes the Uptime SLA) and Premium. Defaults to Free. | `string` | `"Free"` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | The kubernetes version to install onto the cluster | `string` | `"1.28.10"` | no |
| <a name="input_location"></a> [location](#input\_location) | Location to deploy the resources | `string` | `"uksouth"` | no |
| <a name="input_network_resource_group_name"></a> [network\_resource\_group\_name](#input\_network\_resource\_group\_name) | Name of the network resource group | `string` | `"test-network-spoke-network-rg"` | no |
| <a name="input_network_security_group_name"></a> [network\_security\_group\_name](#input\_network\_security\_group\_name) | Name of the network security group | `string` | `"test-network-spoke-network-subnet"` | no |
| <a name="input_nginx_load_balancer"></a> [nginx\_load\_balancer](#input\_nginx\_load\_balancer) | IP adddress for NGINX Ingress Controller Internal Load Balancer | `string` | `"172.18.16.230"` | no |
| <a name="input_owners"></a> [owners](#input\_owners) | A list of object ID's for users that will own (and therefore be able to manage) any Entra ID objects | `list(string)` | n/a | yes |
| <a name="input_pat_token"></a> [pat\_token](#input\_pat\_token) | THE PAT\_TOKEN used to open the repositories | `string` | n/a | yes |
| <a name="input_prefect_hostname"></a> [prefect\_hostname](#input\_prefect\_hostname) | Address to assign to the prefect server | `string` | `"ai.xlthtr.nhs.uk"` | no |
| <a name="input_prefect_postgresql_password"></a> [prefect\_postgresql\_password](#input\_prefect\_postgresql\_password) | Password for the prefect postgresql server | `string` | `"LetMePass@135"` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Naming prefix | `string` | `"lscsandboxsde"` | no |
| <a name="input_private_zone_resource_group_name"></a> [private\_zone\_resource\_group\_name](#input\_private\_zone\_resource\_group\_name) | Name of the resource group containing the private zones | `string` | `""` | no |
| <a name="input_proxy_address"></a> [proxy\_address](#input\_proxy\_address) | Address of the proxy server | `string` | `""` | no |
| <a name="input_sql_server_enabled"></a> [sql\_server\_enabled](#input\_sql\_server\_enabled) | Provision an SQL Server | `bool` | `false` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Id of the subnet where the cluster is to be installed | `string` | `"/subscriptions/5bb2478d-e497-4ca1-964e-4aaa9f754a5d/resourceGroups/test-network-spoke-network-rg/providers/Microsoft.Network/virtualNetworks/test-network-spoke-network-vnet/subnets/test-network-spoke-network-subnet"` | no |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | The ID of the hub subscription | `string` | `"5bb2478d-e497-4ca1-964e-4aaa9f754a5d"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of tags to generate | `map(string)` | <pre>{<br/>  "Environment": "Dev",<br/>  "ManagedBy": "Research Software Design Authority",<br/>  "Product": "LSC SDE",<br/>  "Purpose": "Secure Data Environment",<br/>  "Repository": "https://github.com/lsc-sde/k8s-iac.git"<br/>}</pre> | no |
| <a name="input_virtual_network_id"></a> [virtual\_network\_id](#input\_virtual\_network\_id) | The id of the virtual network we're linking to | `string` | `"/subscriptions/5bb2478d-e497-4ca1-964e-4aaa9f754a5d/resourceGroups/test-network-spoke-network-rg/providers/Microsoft.Network/virtualNetworks/test-network-spoke-network-vnet"` | no |

## Outputs

No outputs.