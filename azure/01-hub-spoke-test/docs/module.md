---
title: Hub-Spoke
parent: Azure
layout: page
grand_parent: Terraform
has_children: true
nav_order: 1
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
| <a name="module_contributorRole"></a> [contributorRole](#module\_contributorRole) | ../modules/contributor-role | n/a |
| <a name="module_dns_appliance"></a> [dns\_appliance](#module\_dns\_appliance) | ../modules/vm-appliance-dns | n/a |
| <a name="module_hub_resource_group"></a> [hub\_resource\_group](#module\_hub\_resource\_group) | ../modules/resource-group | n/a |
| <a name="module_hub_subnet"></a> [hub\_subnet](#module\_hub\_subnet) | ../modules/subnet | n/a |
| <a name="module_hub_vnet"></a> [hub\_vnet](#module\_hub\_vnet) | ../modules/virtual-network | n/a |
| <a name="module_hub_vpn"></a> [hub\_vpn](#module\_hub\_vpn) | ../modules/vpn-gateway | n/a |
| <a name="module_networkContributorRole"></a> [networkContributorRole](#module\_networkContributorRole) | ../modules/network-contributor-role | n/a |
| <a name="module_peering"></a> [peering](#module\_peering) | ../modules/internal-vnet-peering | n/a |
| <a name="module_shareAdminRole"></a> [shareAdminRole](#module\_shareAdminRole) | ../modules/share-administrator-role | n/a |
| <a name="module_spoke_resource_group"></a> [spoke\_resource\_group](#module\_spoke\_resource\_group) | ../modules/resource-group | n/a |
| <a name="module_spoke_subnet"></a> [spoke\_subnet](#module\_spoke\_subnet) | ../modules/subnet | n/a |
| <a name="module_spoke_vnet"></a> [spoke\_vnet](#module\_spoke\_vnet) | ../modules/virtual-network | n/a |
| <a name="module_userAccessAdminRole"></a> [userAccessAdminRole](#module\_userAccessAdminRole) | ../modules/user-access-administrator-role | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | n/a | `string` | `"BadgerMushroom@1556"` | no |
| <a name="input_hub_address_space"></a> [hub\_address\_space](#input\_hub\_address\_space) | Address Space of the Hub Network | `string` | `"10.26.100.128/26"` | no |
| <a name="input_location"></a> [location](#input\_location) | Location to deploy the resources | `string` | `"uksouth"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `""` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | n/a | `string` | `"test-network"` | no |
| <a name="input_service_principal_id"></a> [service\_principal\_id](#input\_service\_principal\_id) | The object ID of the service principal that is going to be used to apply the terraform to | `string` | `"d4b1fc84-f1a1-4522-82d3-23c48ffb2c4c"` | no |
| <a name="input_spoke_address_space"></a> [spoke\_address\_space](#input\_spoke\_address\_space) | Address Space of the Spoke Network | `string` | `"10.26.104.0/25"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of tags to generate | `map(string)` | <pre>{<br/>  "Environment": "Dev",<br/>  "ManagedBy": "Research Software Design Authority",<br/>  "Product": "LSC SDE",<br/>  "Purpose": "Test Network",<br/>  "Repository": "https://github.com/lsc-sde/k8s-iac.git"<br/>}</pre> | no |
| <a name="input_tenant_name"></a> [tenant\_name](#input\_tenant\_name) | The name of the tenant Entra Id Tenant | `string` | `"LANDERTRE.onmicrosoft.com"` | no |
| <a name="input_vpn_client_prefix"></a> [vpn\_client\_prefix](#input\_vpn\_client\_prefix) | CIDR of the VPN client space to assign | `string` | `"10.0.242.0/24"` | no |

## Outputs

No outputs.

<!-- END_TF_DOCS -->