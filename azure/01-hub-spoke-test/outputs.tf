output "hub_resource_group" {
  description = "Name of the hub resource group"
  value = module.hub_resource_group.name
}

output "spoke_resource_group" {
  description = "Name of the spoke resource group"
  value = module.spoke_vnet.name
}

output "hub_vnet_id" {
  description = "The id of the hub VNET"
  value = module.hub_vnet.id
}

output "spoke_vnet_id" {
  description = "The id of the spoke VNET"
  value = module.spoke_vnet.id
}

output "hub_subnet_id" {
    description = "The id of the hub subnet"
    value = module.hub_subnet.id
}

output "spoke_subnet_id" {
    description = "The id of the hub subnet"
    value = module.spoke_subnet.id
}

output "dns_server_ip_address" {
    description = "The IP address of the DNS Server"
    value = module.dns_appliance.ip_address
}

output "file_share_private_dns_zone_id" {
    description = "The ID of the file share private dns zone"
    value = module.filePrivateLinkDnsZone.id
}

output "blob_storage_private_dns_zone_id" {
    description = "The ID of the file share private dns zone"
    value = module.blobPrivateLinkDnsZone.id
}

output "our_private_dns_zone_id" {
    description = "The ID of the file share private dns zone"
    value = module.ourPrivateLinkDnsZone.id
}

output "subscription_id" {
  description = "The id of the subscription where the resources have been deployed"
  value = data.azurerm_subscription.current.subscription_id
}

output "tenant_id" {
  description = "The id of the tenant where the resources have been deployed"
  value = data.azurerm_subscription.current.tenant_id
}
