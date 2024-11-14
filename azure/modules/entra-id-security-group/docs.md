<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azuread_group.main](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/group) | resource |
| [azuread_group_member.parent](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/group_member) | resource |
| [azuread_client_config.current](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment_name"></a> [environment\_name](#input\_environment\_name) | The environment name for the App Registration Name | `string` | n/a | yes |
| <a name="input_has_parent"></a> [has\_parent](#input\_has\_parent) | This group has a parent group associated | `bool` | `false` | no |
| <a name="input_owners"></a> [owners](#input\_owners) | A list of object ID's for users that will own (and therefore be able to manage) any Entra ID objects | `list(string)` | n/a | yes |
| <a name="input_parent_group_object_id"></a> [parent\_group\_object\_id](#input\_parent\_group\_object\_id) | The object ID of the parent group | `string` | `""` | no |
| <a name="input_purpose"></a> [purpose](#input\_purpose) | Purpose of the App Registration | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_object_id"></a> [object\_id](#output\_object\_id) | n/a |
<!-- END_TF_DOCS -->