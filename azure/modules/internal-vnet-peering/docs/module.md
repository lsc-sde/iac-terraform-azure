---
title: internal-vnet-peering
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

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_network_peering.a](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.b](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_destination_name"></a> [destination\_name](#input\_destination\_name) | Short name for the destination network | `string` | n/a | yes |
| <a name="input_destination_resource_group_name"></a> [destination\_resource\_group\_name](#input\_destination\_resource\_group\_name) | The resource group name for the destination network | `string` | n/a | yes |
| <a name="input_destination_virtual_network_id"></a> [destination\_virtual\_network\_id](#input\_destination\_virtual\_network\_id) | The destination network vnet id | `string` | n/a | yes |
| <a name="input_destination_virtual_network_name"></a> [destination\_virtual\_network\_name](#input\_destination\_virtual\_network\_name) | The vnet name for the destination network | `string` | n/a | yes |
| <a name="input_source_name"></a> [source\_name](#input\_source\_name) | Short name for the source network | `string` | n/a | yes |
| <a name="input_source_resource_group_name"></a> [source\_resource\_group\_name](#input\_source\_resource\_group\_name) | The resource group name for the source network | `string` | n/a | yes |
| <a name="input_source_virtual_network_id"></a> [source\_virtual\_network\_id](#input\_source\_virtual\_network\_id) | The source network vnet id | `string` | n/a | yes |
| <a name="input_source_virtual_network_name"></a> [source\_virtual\_network\_name](#input\_source\_virtual\_network\_name) | The vnet name for the source network | `string` | n/a | yes |

## Outputs

No outputs.

<!-- END_TF_DOCS -->