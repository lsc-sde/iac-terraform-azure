---
title: container-registry
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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_tasks_acr_pull"></a> [tasks\_acr\_pull](#module\_tasks\_acr\_pull) | ../role-assignment | n/a |
| <a name="module_tasks_acr_push"></a> [tasks\_acr\_push](#module\_tasks\_acr\_push) | ../role-assignment | n/a |
| <a name="module_tasks_contributor"></a> [tasks\_contributor](#module\_tasks\_contributor) | ../role-assignment | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_container_registry.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry) | resource |
| [azurerm_key_vault_secret.admin_password](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.admin_username](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_private_endpoint.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_user_assigned_identity.tasks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |
| [azurerm_private_dns_zone.data](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/private_dns_zone) | data source |
| [azurerm_private_dns_zone.frontend](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/private_dns_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_hub_subscription_id"></a> [hub\_subscription\_id](#input\_hub\_subscription\_id) | The ID of the hub subscription | `string` | n/a | yes |
| <a name="input_identity_name"></a> [identity\_name](#input\_identity\_name) | Name of the managed identity for the cluster | `string` | `""` | no |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | The ID of the key vault where we will store the ACR Admin Password | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location to setup resources | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the cluster | `string` | `""` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Naming Prefix | `string` | `""` | no |
| <a name="input_privatezone_resource_group_name"></a> [privatezone\_resource\_group\_name](#input\_privatezone\_resource\_group\_name) | resource group for the azure file private zone | `string` | `""` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group under which to build this cluster | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Id for the subnet | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | The subscription id to deploy this to | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | List of tags to generate | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_fqdn"></a> [fqdn](#output\_fqdn) | FQDN of the registry |
| <a name="output_id"></a> [id](#output\_id) | ID of the container registry |
| <a name="output_task_client_id"></a> [task\_client\_id](#output\_task\_client\_id) | Client Id of the managed identity to be used by tasks |
| <a name="output_task_identity_id"></a> [task\_identity\_id](#output\_task\_identity\_id) | Id of the managed identity to be used by tasks |

<!-- END_TF_DOCS -->