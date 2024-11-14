<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.25.2 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cluster_config"></a> [cluster\_config](#module\_cluster\_config) | ./config-map | n/a |
| <a name="module_namespace"></a> [namespace](#module\_namespace) | ./namespace | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_certificate"></a> [client\_certificate](#input\_client\_certificate) | Client certificate for talking to the kubernetes API | `string` | n/a | yes |
| <a name="input_client_key"></a> [client\_key](#input\_client\_key) | Client key for talking to the kubernetes API | `string` | n/a | yes |
| <a name="input_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#input\_cluster\_ca\_certificate) | CA Certificate for talking to the kubernetes API | `string` | n/a | yes |
| <a name="input_cluster_configuation"></a> [cluster\_configuation](#input\_cluster\_configuation) | Map of literal values to pass in | `map(string)` | n/a | yes |
| <a name="input_host"></a> [host](#input\_host) | The cluster host address for talking to the Kubernetes API | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->