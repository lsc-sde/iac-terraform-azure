---
title: postgresql-single-server
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
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_secret.password](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_postgresql_server.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_server) | resource |
| [azurerm_private_endpoint.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_user_assigned_identity.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [random_string.username_suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [azurerm_private_dns_zone.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/private_dns_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_hub_subscription_id"></a> [hub\_subscription\_id](#input\_hub\_subscription\_id) | The ID of the hub subscription | `string` | n/a | yes |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | The ID of the key vault to add the secret to | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location to setup resources | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the cluster | `string` | `""` | no |
| <a name="input_posgresql_version"></a> [posgresql\_version](#input\_posgresql\_version) | Version of postgresql to use | `string` | `"11"` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Naming Prefix | `string` | `""` | no |
| <a name="input_privatezone_resource_group_name"></a> [privatezone\_resource\_group\_name](#input\_privatezone\_resource\_group\_name) | resource group for the azure file private zone | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group under which to build this cluster | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | Specifies the SKU Name for this PostgreSQL Server. The name of the SKU, follows the tier + family + cores pattern (e.g. B\_Gen4\_1, GP\_Gen5\_8). For more information see the product documentation. Possible values are B\_Gen4\_1, B\_Gen4\_2, B\_Gen5\_1, B\_Gen5\_2, GP\_Gen4\_2, GP\_Gen4\_4, GP\_Gen4\_8, GP\_Gen4\_16, GP\_Gen4\_32, GP\_Gen5\_2, GP\_Gen5\_4, GP\_Gen5\_8, GP\_Gen5\_16, GP\_Gen5\_32, GP\_Gen5\_64, MO\_Gen5\_2, MO\_Gen5\_4, MO\_Gen5\_8, MO\_Gen5\_16 and MO\_Gen5\_32. | `string` | `"GP_Gen5_2"` | no |
| <a name="input_storage_mb"></a> [storage\_mb](#input\_storage\_mb) | (Optional) The max storage allowed for the PostgreSQL Flexible Server. Possible values are 32768, 65536, 131072, 262144, 524288, 1048576, 2097152, 4193280, 4194304, 8388608, 16777216 and 33553408 | `number` | `5120` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Id for the subnet | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | The subscription id to deploy this to | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | List of tags to generate | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_fqdn"></a> [fqdn](#output\_fqdn) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_username"></a> [username](#output\_username) | n/a |

<!-- END_TF_DOCS -->