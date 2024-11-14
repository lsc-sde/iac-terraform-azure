<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_role_assignment.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [random_uuid.main](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/uuid) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_principal_id"></a> [principal\_id](#input\_principal\_id) | n/a | `string` | n/a | yes |
| <a name="input_role_definition_name"></a> [role\_definition\_name](#input\_role\_definition\_name) | n/a | `string` | n/a | yes |
| <a name="input_scope"></a> [scope](#input\_scope) | n/a | `string` | n/a | yes |
| <a name="input_skip_service_principal_aad_check"></a> [skip\_service\_principal\_aad\_check](#input\_skip\_service\_principal\_aad\_check) | Skip Service Principal AAD Check | `bool` | `true` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->