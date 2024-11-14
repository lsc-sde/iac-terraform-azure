---
title: container-registry-tasks
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
| [azurerm_container_registry_task.datascience_notebook](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry_task) | resource |
| [azurerm_container_registry_task_schedule_run_now.datascience_notebook](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry_task_schedule_run_now) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_branch_name"></a> [branch\_name](#input\_branch\_name) | The branch to follow on source control | `string` | n/a | yes |
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | Client ID of the user managed identity used | `string` | n/a | yes |
| <a name="input_container_registry_id"></a> [container\_registry\_id](#input\_container\_registry\_id) | ID of the container registry | `string` | n/a | yes |
| <a name="input_enable_datascience_notebook"></a> [enable\_datascience\_notebook](#input\_enable\_datascience\_notebook) | Feature flag for enabling datascience notebook | `bool` | `false` | no |
| <a name="input_login_server"></a> [login\_server](#input\_login\_server) | The FQDN of the ACR registry | `string` | n/a | yes |
| <a name="input_pat_token"></a> [pat\_token](#input\_pat\_token) | PAT TOKEN to use when talking to the repositories | `string` | n/a | yes |
| <a name="input_run_now"></a> [run\_now](#input\_run\_now) | Run the tasks now | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of tags to generate | `map(string)` | n/a | yes |
| <a name="input_user_assigned_identity_id"></a> [user\_assigned\_identity\_id](#input\_user\_assigned\_identity\_id) | ID of the user managed identity used | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->