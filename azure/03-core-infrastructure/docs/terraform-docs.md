---
title: Terraform Documents
parent: Azure
layout: page
grand_parent: Terraform
has_children: true
---

## Requirements

The following requirements are needed by this module:

- <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) (2.47.0)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (3.88.0)

- <a name="requirement_random"></a> [random](#requirement\_random) (3.6.0)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (3.88.0)

- <a name="provider_random"></a> [random](#provider\_random) (3.6.0)

## Modules

The following Modules are called:

### <a name="module_container_registry"></a> [container\_registry](#module\_container\_registry)

Source: ../modules/container-registry

Version:

### <a name="module_container_registry_tasks"></a> [container\_registry\_tasks](#module\_container\_registry\_tasks)

Source: ../modules/container-registry-tasks

Version:

### <a name="module_datascience_large_nodepool"></a> [datascience\_large\_nodepool](#module\_datascience\_large\_nodepool)

Source: ../modules/kubernetes-node-pool

Version:

### <a name="module_diagnostics_workspace"></a> [diagnostics\_workspace](#module\_diagnostics\_workspace)

Source: ../modules/diagnostics-workspace

Version:

### <a name="module_jupyter_admins"></a> [jupyter\_admins](#module\_jupyter\_admins)

Source: ../modules/entra-id-security-group

Version:

### <a name="module_jupyter_users"></a> [jupyter\_users](#module\_jupyter\_users)

Source: ../modules/entra-id-security-group

Version:

### <a name="module_jupytersp"></a> [jupytersp](#module\_jupytersp)

Source: ../modules/entra-id-app-registration

Version:

### <a name="module_keda"></a> [keda](#module\_keda)

Source: ../modules/kubernetes-deployment-script

Version:

### <a name="module_key_vault"></a> [key\_vault](#module\_key\_vault)

Source: ../modules/keyvault

Version:

### <a name="module_keycloak_database"></a> [keycloak\_database](#module\_keycloak\_database)

Source: ../modules/sql-database

Version:

### <a name="module_kubernetes_cluster"></a> [kubernetes\_cluster](#module\_kubernetes\_cluster)

Source: ../modules/kubernetes-cluster-kubenet

Version:

### <a name="module_kubernetes_cluster_configuration"></a> [kubernetes\_cluster\_configuration](#module\_kubernetes\_cluster\_configuration)

Source: ../../kubernetes

Version:

### <a name="module_ohdsisp"></a> [ohdsisp](#module\_ohdsisp)

Source: ../modules/entra-id-app-registration

Version:

### <a name="module_postgresql"></a> [postgresql](#module\_postgresql)

Source: ../modules/postgresql-single-server

Version:

### <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group)

Source: ../modules/resource-group

Version:

### <a name="module_sql_server"></a> [sql\_server](#module\_sql\_server)

Source: ../modules/sql-server

Version:

### <a name="module_storage_account"></a> [storage\_account](#module\_storage\_account)

Source: ../modules/storage-account

Version:

### <a name="module_supersetsp"></a> [supersetsp](#module\_supersetsp)

Source: ../modules/entra-id-app-registration

Version:

## Resources

The following resources are used by this module:

- [azurerm_key_vault_secret.admin_password](https://registry.terraform.io/providers/hashicorp/azurerm/3.88.0/docs/resources/key_vault_secret) (resource)
- [azurerm_key_vault_secret.jupyter_cookie_secret](https://registry.terraform.io/providers/hashicorp/azurerm/3.88.0/docs/resources/key_vault_secret) (resource)
- [random_bytes.jupyter_cookie_secret](https://registry.terraform.io/providers/hashicorp/random/3.6.0/docs/resources/bytes) (resource)
- [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.88.0/docs/data-sources/client_config) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_dns_prefix"></a> [dns\_prefix](#input\_dns\_prefix)

Description: The prefix for any DNS records on the private DNS

Type: `string`

### <a name="input_dns_zone"></a> [dns\_zone](#input\_dns\_zone)

Description: The DNS zone for any DNS records on private DNS

Type: `string`

### <a name="input_owners"></a> [owners](#input\_owners)

Description: A list of object ID's for users that will own (and therefore be able to manage) any Entra ID objects

Type: `list(string)`

### <a name="input_pat_token"></a> [pat\_token](#input\_pat\_token)

Description: THE PAT\_TOKEN used to open the repositories

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_apply_nsg_rules"></a> [apply\_nsg\_rules](#input\_apply\_nsg\_rules)

Description: apply NSG rules

Type: `bool`

Default: `true`

### <a name="input_branch_name"></a> [branch\_name](#input\_branch\_name)

Description: The branch to follow on source control

Type: `string`

Default: `"main"`

### <a name="input_cluster_admin_ids"></a> [cluster\_admin\_ids](#input\_cluster\_admin\_ids)

Description: A list of groups with admin access over the cluster

Type: `list(string)`

Default:

```json
[
  "1fff09c5-0c5d-42e7-b3b6-e60f5b445de6"
]
```

### <a name="input_datascience_large_nodepool_vm_size"></a> [datascience\_large\_nodepool\_vm\_size](#input\_datascience\_large\_nodepool\_vm\_size)

Description: VM Sku for the large datascience node pools

Type: `string`

Default: `"Standard_E8as_v5"`

### <a name="input_defender_log_analytics_workspace_id"></a> [defender\_log\_analytics\_workspace\_id](#input\_defender\_log\_analytics\_workspace\_id)

Description: ID of the log analytics workspace used by the microsoft defender configuration on k8s

Type: `string`

Default: `null`

### <a name="input_enable_gitops"></a> [enable\_gitops](#input\_enable\_gitops)

Description: Enable the gitops

Type: `bool`

Default: `true`

### <a name="input_enable_hub_dns"></a> [enable\_hub\_dns](#input\_enable\_hub\_dns)

Description: Installs the private zone dns into the hub network

Type: `bool`

Default: `true`

### <a name="input_environment_name"></a> [environment\_name](#input\_environment\_name)

Description: Name of the environment (in lowercase)

Type: `string`

Default: `"sandbox"`

### <a name="input_flux_url"></a> [flux\_url](#input\_flux\_url)

Description: The URL of the flux repository used to configure the environment

Type: `string`

Default: `"https://github.com/lsc-sde/iac-flux-lscsde"`

### <a name="input_hub_subscription_id"></a> [hub\_subscription\_id](#input\_hub\_subscription\_id)

Description: The ID of the hub subscription

Type: `string`

Default: `"5bb2478d-e497-4ca1-964e-4aaa9f754a5d"`

### <a name="input_hub_virtual_network_id"></a> [hub\_virtual\_network\_id](#input\_hub\_virtual\_network\_id)

Description: The id of the hub virtual network we're linking to

Type: `string`

Default: `"/subscriptions/de97be38-945e-4824-a44b-5b101c0e048b/resourceGroups/rg-icb-uks-plt-network/providers/Microsoft.Network/virtualNetworks/vnet-icb-uks-plt-azFirewall"`

### <a name="input_ip_rules"></a> [ip\_rules](#input\_ip\_rules)

Description: List of allowed IP addresses

Type: `list(string)`

Default:

```json
[
  "208.127.197.187"
]
```

### <a name="input_k8s_admin_group"></a> [k8s\_admin\_group](#input\_k8s\_admin\_group)

Description: Group

Type: `string`

Default: `"1fff09c5-0c5d-42e7-b3b6-e60f5b445de6"`

### <a name="input_keycloak_database_enabled"></a> [keycloak\_database\_enabled](#input\_keycloak\_database\_enabled)

Description: Provision an Keycloak database

Type: `bool`

Default: `false`

### <a name="input_keycloak_db_sku_name"></a> [keycloak\_db\_sku\_name](#input\_keycloak\_db\_sku\_name)

Description: Name of the SKU for the keycloak database

Type: `string`

Default: `"S0"`

### <a name="input_keyvault_allowed_ips"></a> [keyvault\_allowed\_ips](#input\_keyvault\_allowed\_ips)

Description: List

Type: `list(string)`

Default: `[]`

### <a name="input_keyvault_public_network_access_enabled"></a> [keyvault\_public\_network\_access\_enabled](#input\_keyvault\_public\_network\_access\_enabled)

Description: Allow public access to the key vault

Type: `bool`

Default: `false`

### <a name="input_keyvault_purge_protection_enabled"></a> [keyvault\_purge\_protection\_enabled](#input\_keyvault\_purge\_protection\_enabled)

Description: Enable Purge protection

Type: `bool`

Default: `false`

### <a name="input_kubernetes_nsg_priority_start"></a> [kubernetes\_nsg\_priority\_start](#input\_kubernetes\_nsg\_priority\_start)

Description: priority id for kubernetes nsg to start

Type: `number`

Default: `100`

### <a name="input_kubernetes_sku_tier"></a> [kubernetes\_sku\_tier](#input\_kubernetes\_sku\_tier)

Description: The SKU Tier that should be used for this Kubernetes Cluster. Possible values are Free, Standard (which includes the Uptime SLA) and Premium. Defaults to Free.

Type: `string`

Default: `"Free"`

### <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version)

Description: The kubernetes version to install onto the cluster

Type: `string`

Default: `"1.28.10"`

### <a name="input_location"></a> [location](#input\_location)

Description: Location to deploy the resources

Type: `string`

Default: `"uksouth"`

### <a name="input_network_resource_group_name"></a> [network\_resource\_group\_name](#input\_network\_resource\_group\_name)

Description: Name of the network resource group

Type: `string`

Default: `"test-network-spoke-network-rg"`

### <a name="input_network_security_group_name"></a> [network\_security\_group\_name](#input\_network\_security\_group\_name)

Description: Name of the network security group

Type: `string`

Default: `"test-network-spoke-network-subnet"`

### <a name="input_nginx_load_balancer"></a> [nginx\_load\_balancer](#input\_nginx\_load\_balancer)

Description: IP adddress for NGINX Ingress Controller Internal Load Balancer

Type: `string`

Default: `"172.18.16.230"`

### <a name="input_prefect_hostname"></a> [prefect\_hostname](#input\_prefect\_hostname)

Description: Address to assign to the prefect server

Type: `string`

Default: `"ai.xlthtr.nhs.uk"`

### <a name="input_prefect_postgresql_password"></a> [prefect\_postgresql\_password](#input\_prefect\_postgresql\_password)

Description: Password for the prefect postgresql server

Type: `string`

Default: `"LetMePass@135"`

### <a name="input_prefix"></a> [prefix](#input\_prefix)

Description: Naming prefix

Type: `string`

Default: `"lscsandboxsde"`

### <a name="input_private_zone_resource_group_name"></a> [private\_zone\_resource\_group\_name](#input\_private\_zone\_resource\_group\_name)

Description: Name of the resource group containing the private zones

Type: `string`

Default: `""`

### <a name="input_proxy_address"></a> [proxy\_address](#input\_proxy\_address)

Description: Address of the proxy server

Type: `string`

Default: `""`

### <a name="input_sql_server_enabled"></a> [sql\_server\_enabled](#input\_sql\_server\_enabled)

Description: Provision an SQL Server

Type: `bool`

Default: `false`

### <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id)

Description: Id of the subnet where the cluster is to be installed

Type: `string`

Default: `"/subscriptions/5bb2478d-e497-4ca1-964e-4aaa9f754a5d/resourceGroups/test-network-spoke-network-rg/providers/Microsoft.Network/virtualNetworks/test-network-spoke-network-vnet/subnets/test-network-spoke-network-subnet"`

### <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id)

Description: The ID of the hub subscription

Type: `string`

Default: `"5bb2478d-e497-4ca1-964e-4aaa9f754a5d"`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: List of tags to generate

Type: `map(string)`

Default:

```json
{
  "Environment": "Dev",
  "ManagedBy": "Research Software Design Authority",
  "Product": "LSC SDE",
  "Purpose": "Secure Data Environment",
  "Repository": "https://github.com/lsc-sde/k8s-iac.git"
}
```

### <a name="input_virtual_network_id"></a> [virtual\_network\_id](#input\_virtual\_network\_id)

Description: The id of the virtual network we're linking to

Type: `string`

Default: `"/subscriptions/5bb2478d-e497-4ca1-964e-4aaa9f754a5d/resourceGroups/test-network-spoke-network-rg/providers/Microsoft.Network/virtualNetworks/test-network-spoke-network-vnet"`

## Outputs

No outputs.