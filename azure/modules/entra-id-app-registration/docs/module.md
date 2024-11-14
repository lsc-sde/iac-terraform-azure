---
title: entra-id-app-registration
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
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | n/a |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azuread_application.main](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application) | resource |
| [azuread_application_password.main](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application_password) | resource |
| [azuread_service_principal.main](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal) | resource |
| [azurerm_key_vault_secret.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azuread_client_config.current](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_fqdn"></a> [client\_fqdn](#input\_client\_fqdn) | The Fully qualified domain name of the client application | `string` | n/a | yes |
| <a name="input_environment_name"></a> [environment\_name](#input\_environment\_name) | The environment name for the App Registration Name | `string` | n/a | yes |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | The ID of the key vault to add the secret to | `string` | n/a | yes |
| <a name="input_logout_url_suffix"></a> [logout\_url\_suffix](#input\_logout\_url\_suffix) | The path to logout | `string` | `"/logout"` | no |
| <a name="input_owners"></a> [owners](#input\_owners) | A list of object ID's for users that will own (and therefore be able to manage) any Entra ID objects | `list(string)` | n/a | yes |
| <a name="input_purpose"></a> [purpose](#input\_purpose) | Purpose of the App Registration | `string` | n/a | yes |
| <a name="input_redirect_path_suffix"></a> [redirect\_path\_suffix](#input\_redirect\_path\_suffix) | The path to login | `string` | n/a | yes |
| <a name="input_secret_name"></a> [secret\_name](#input\_secret\_name) | Name of the secret in azure key vault | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_id"></a> [client\_id](#output\_client\_id) | n/a |
| <a name="output_object_id"></a> [object\_id](#output\_object\_id) | n/a |

<!-- END_TF_DOCS -->