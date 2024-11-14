---
title: keyvault
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
| <a name="provider_azurerm.hubsubscription"></a> [azurerm.hubsubscription](#provider\_azurerm.hubsubscription) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault.keyVault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |
| [azurerm_private_endpoint.keyVault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_role_assignment.k8s_admin_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.k8s_admin_group_kvco](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.k8s_admin_group_kvso](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_user_assigned_identity.keyVault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_private_dns_zone.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/private_dns_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_ips"></a> [allowed\_ips](#input\_allowed\_ips) | List of IP's that can talk to key vault | `list(string)` | n/a | yes |
| <a name="input_hub_subscription_id"></a> [hub\_subscription\_id](#input\_hub\_subscription\_id) | The ID of the hub subscription | `string` | n/a | yes |
| <a name="input_identity_name"></a> [identity\_name](#input\_identity\_name) | Name of the managed identity for the cluster | `string` | `""` | no |
| <a name="input_k8s_admin_group"></a> [k8s\_admin\_group](#input\_k8s\_admin\_group) | Group | `string` | n/a | yes |
| <a name="input_keyvault_privatezone_enabled"></a> [keyvault\_privatezone\_enabled](#input\_keyvault\_privatezone\_enabled) | Whether to create the private zone records | `bool` | `false` | no |
| <a name="input_keyvault_privatezone_resource_group_name"></a> [keyvault\_privatezone\_resource\_group\_name](#input\_keyvault\_privatezone\_resource\_group\_name) | resource group for the azure file private zone | `string` | `""` | no |
| <a name="input_location"></a> [location](#input\_location) | The location to setup resources | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the cluster | `string` | `""` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Naming Prefix | `string` | `""` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Allow public access to the key vault | `bool` | n/a | yes |
| <a name="input_purge_protection_enabled"></a> [purge\_protection\_enabled](#input\_purge\_protection\_enabled) | Enable Purge protection | `bool` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group under which to build this cluster | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Id for the subnet | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | The subscription id to deploy this to | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | List of tags to generate | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
<!-- END_TF_DOCS -->