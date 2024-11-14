---
title: container-registry
parent: Modules
grand_parent: Terraform
layout: page
---

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_config_map.main](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/config_map) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_literals"></a> [literals](#input\_literals) | Map of literal values to pass in | `map(string)` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the resource to deploy | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace to deploy the resource | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | n/a |
<!-- END_TF_DOCS -->