module "hub_resource_group" {
  source = "../modules/resource-group"
  prefix = "${var.prefix}-hub-network"
  tags = merge(var.tags, { "Purpose" = "Test Hub Network"})
  location = var.location
}

resource "random_string" "name" {
  length = 5
  upper = false
  special = false
  lower = true
  numeric = true
}

module "diagnostics_workspace" {
  source = "../modules/diagnostics-workspace"

  resource_group_name = module.hub_resource_group.name
  tags = var.tags
  location = var.location
  name = random_string.name.result
}

module "spoke_resource_group" {
  source = "../modules/resource-group"
  prefix = "${var.prefix}-spoke-network"
  tags = merge(var.tags, { "Purpose" = "Test Spoke Network"})
  location = var.location
}

module "hub_vnet" {
  source = "../modules/virtual-network"

  address_space = var.hub_address_space
  prefix = "${var.prefix}-hub-network"
  location = var.location
  resource_group_name = module.hub_resource_group.name
  tags = merge(var.tags, { "Purpose" = "Test Hub Network"})
}

module "spoke_vnet" {
  source = "../modules/virtual-network"
  prefix = "${var.prefix}-spoke-network"
  address_space = var.spoke_address_space
  location = var.location
  resource_group_name = module.spoke_resource_group.name
  tags = merge(var.tags, { "Purpose" = "Test Spoke Network"})
}

module "hub_subnet" {
  source = "../modules/subnet"

  resource_group_name = module.hub_resource_group.name
  virtual_network_name = module.hub_vnet.name
  prefix = "${var.prefix}-hub-network"
  address_space = local.hub_subnet
  location = var.location
  tags = var.tags
  default_service_endpoints = true
}

module "spoke_subnet" {
  source = "../modules/subnet"

  resource_group_name = module.spoke_resource_group.name
  virtual_network_name = module.spoke_vnet.name
  prefix = "${var.prefix}-spoke-network"
  address_space = var.spoke_address_space
  location = var.location
  tags = var.tags
  default_service_endpoints = true
}


module "hub_vpn" {
  source = "../modules/vpn-gateway"
  resource_group_name = module.hub_resource_group.name
  gateway_subnet_prefix = local.vpn_subnet
  location = var.location
  tags = merge(var.tags, 
  {
    "Hub.Subnet": module.hub_subnet.id
    "Spoke.Subnet": module.spoke_subnet.id
  })
  vpn_client_prefix = var.vpn_client_prefix 
  virtual_network_name = module.hub_vnet.name
  prefix = var.prefix
  tenant_name = var.tenant_name
  spoke_address_space = var.spoke_address_space

  depends_on = [ 
    module.hub_subnet,
    module.spoke_subnet
   ]
}


module "dns_appliance" {
  source = "../modules/vm-appliance-dns"
  resource_group_name = module.hub_resource_group.name
  tags = var.tags
  location = var.location
  purpose = "Test DNS Appliance"
  subnet_id = module.hub_subnet.id
  admin_password = var.admin_password
  prefix = "${var.prefix}-dns"
  vpn_subnet_cidr = module.hub_vpn.vpn_cidr
  virtual_network_id = module.hub_vnet.id
  network_security_group_name = module.hub_subnet.security_group_name
}

module "peering" {
  source = "../modules/internal-vnet-peering"

  source_name = "Hub"
  source_resource_group_name = module.hub_resource_group.name
  source_virtual_network_id = module.hub_vnet.id
  source_virtual_network_name = module.hub_vnet.name
  
  destination_name = "Spoke"
  destination_resource_group_name = module.spoke_resource_group.name
  destination_virtual_network_id = module.spoke_vnet.id
  destination_virtual_network_name = module.spoke_vnet.name
}

module "contributorRole" {
  source = "../modules/contributor-role"

  service_principal_id = var.service_principal_id
}

module "networkContributorRole" {
  source = "../modules/network-contributor-role"

  service_principal_id = var.service_principal_id
}

module "userAccessAdminRole" {
  source = "../modules/user-access-administrator-role"

  service_principal_id = var.service_principal_id
}

module "blobPrivateLinkDnsZone" {
  source = "../modules/private-dns-zone"
  
  name = "privatelink.blob.core.windows.net"
  resource_group_name = module.hub_resource_group.name
  tags = var.tags
  virtual_network_id = module.hub_vnet.id
}

module "filePrivateLinkDnsZone" {
  source = "../modules/private-dns-zone"
  
  name = "privatelink.file.core.windows.net"
  resource_group_name = module.hub_resource_group.name
  tags = var.tags
  virtual_network_id = module.hub_vnet.id
  spoke_virtual_network_id = module.spoke_vnet.id
  enable_spoke_dns = true
}

module "keyvaultPrivateLinkDnsZone" {
  source = "../modules/private-dns-zone"
  
  name = "privatelink.vaultcore.azure.net"
  resource_group_name = module.hub_resource_group.name
  tags = var.tags
  virtual_network_id = module.hub_vnet.id
  spoke_virtual_network_id = module.spoke_vnet.id
  enable_spoke_dns = true
}

module "postgresPrivateLinkDnsZone" {
  source = "../modules/private-dns-zone"
  
  name = "privatelink.postgres.database.azure.com"
  resource_group_name = module.hub_resource_group.name
  tags = var.tags
  virtual_network_id = module.hub_vnet.id
  spoke_virtual_network_id = module.spoke_vnet.id
  enable_spoke_dns = true
}


module "acrPrivateLinkDnsZone" {
  source = "../modules/private-dns-zone"
  
  name = "${var.location}.privatelink.azurecr.io"
  resource_group_name = module.hub_resource_group.name
  tags = var.tags
  virtual_network_id = module.hub_vnet.id
  spoke_virtual_network_id = module.spoke_vnet.id
  enable_spoke_dns = true
}

module "localacrPrivateLinkDnsZone" {
  source = "../modules/private-dns-zone"
  
  name = "privatelink.azurecr.io"
  resource_group_name = module.hub_resource_group.name
  tags = var.tags
  virtual_network_id = module.hub_vnet.id
  spoke_virtual_network_id = module.spoke_vnet.id
  enable_spoke_dns = true
}




module "localacrPrivateLinkDnsZone2" {
  source = "../modules/private-dns-zone"
  
  name = "privatelink.${var.location}.azmk8s.io"
  resource_group_name = module.hub_resource_group.name
  tags = var.tags
  virtual_network_id = module.hub_vnet.id
  spoke_virtual_network_id = module.spoke_vnet.id
  enable_spoke_dns = true
}




module "ourPrivateLinkDnsZone" {
  source = "../modules/private-dns-zone"
  
  name = var.private_dns_zone_name
  resource_group_name = module.hub_resource_group.name
  tags = var.tags
  virtual_network_id = module.hub_vnet.id
  spoke_virtual_network_id = module.spoke_vnet.id
  enable_spoke_dns = true
}

#module "shareAdminRole"{
#  source = "../modules/share-administrator-role"
#
#  service_principal_id = var.service_principal_id
#}
