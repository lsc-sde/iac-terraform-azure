---
title: diagnostics-workspace
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
| [azurerm_log_analytics_workspace.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | The location to setup resources | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the cluster | `string` | `""` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Naming Prefix | `string` | `""` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group under which to build this cluster | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | List of tags to generate | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | ID of the diagnostics workspace |
| <a name="output_name"></a> [name](#output\_name) | name of the diagnostics workspace |
| <a name="output_workspace_id"></a> [workspace\_id](#output\_workspace\_id) | Workspace ID of the diagnostics workspace |
<!-- END_TF_DOCS -->