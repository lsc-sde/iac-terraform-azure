---
title: storage-account-secret
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
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_secret.storage](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name of the secret | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace to deploy the secret | `string` | n/a | yes |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | Name of the storage account | `string` | n/a | yes |
| <a name="input_storage_account_primary_access_key"></a> [storage\_account\_primary\_access\_key](#input\_storage\_account\_primary\_access\_key) | Primary access key of the storage account | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->