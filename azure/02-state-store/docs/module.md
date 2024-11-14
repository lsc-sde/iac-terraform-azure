---
title: State Store
parent: Azure
layout: page
grand_parent: Terraform
has_children: true
nav_order: 2
---

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.84.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.6.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | ../modules/resource-group | n/a |
| <a name="module_role_assignment"></a> [role\_assignment](#module\_role\_assignment) | ../modules/role-assignment | n/a |
| <a name="module_storage"></a> [storage](#module\_storage) | ../modules/storage-account | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_group_id"></a> [admin\_group\_id](#input\_admin\_group\_id) | id of the admin group | `string` | n/a | yes |
| <a name="input_hub_subscription_id"></a> [hub\_subscription\_id](#input\_hub\_subscription\_id) | The ID of the hub subscription | `string` | n/a | yes |
| <a name="input_ip_rules"></a> [ip\_rules](#input\_ip\_rules) | List of allowed IP addresses | `list(string)` | <pre>[<br/>  "208.127.197.187"<br/>]</pre> | no |
| <a name="input_location"></a> [location](#input\_location) | Location to deploy the resources | `string` | `"uksouth"` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Naming prefix | `string` | `"lscsandboxsde"` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Id of the subnet where the cluster is to be installed | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | List of tags to generate | `map(string)` | <pre>{<br/>  "Environment": "Dev",<br/>  "ManagedBy": "Research Software Design Authority",<br/>  "Product": "LSC SDE",<br/>  "Purpose": "Terraform State",<br/>  "Repository": "https://github.com/lsc-sde/k8s-iac.git"<br/>}</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->