---
title: kubernetes-node-pool
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
| [azurerm_kubernetes_cluster_node_pool.node_pool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_node_pool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | The ID of the kubernetes cluster | `string` | n/a | yes |
| <a name="input_enable_auto_scaling"></a> [enable\_auto\_scaling](#input\_enable\_auto\_scaling) | Enables auto scaling on the node pool | `bool` | `true` | no |
| <a name="input_max_count"></a> [max\_count](#input\_max\_count) | Maximum number of nodes | `number` | `1` | no |
| <a name="input_max_pods"></a> [max\_pods](#input\_max\_pods) | Maximum pods allowed on the node pool | `number` | `110` | no |
| <a name="input_min_count"></a> [min\_count](#input\_min\_count) | Minimum number of nodes | `number` | `0` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the node pool | `string` | n/a | yes |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | Initial number of nodes | `number` | `0` | no |
| <a name="input_node_labels"></a> [node\_labels](#input\_node\_labels) | Labels to apply against these nodes | `map(string)` | `{}` | no |
| <a name="input_node_taints"></a> [node\_taints](#input\_node\_taints) | Taints to apply against these nodes | `list(string)` | `[]` | no |
| <a name="input_purpose"></a> [purpose](#input\_purpose) | The purpose of the node pool | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | List of tags to generate | `map(string)` | n/a | yes |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | n/a | `string` | n/a | yes |
| <a name="input_vnet_subnet_id"></a> [vnet\_subnet\_id](#input\_vnet\_subnet\_id) | The subnet ID that these nodes will be attached to | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->