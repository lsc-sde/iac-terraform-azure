location = "uksouth"
prefix = "lscsdesandbox"
tags = {
    "Environment" = "Sandbox",
    "Application Name" = "Secure Data Environment",
    "Project Name" = "TRE Environment",
    "Technical Contact" = "shaun.turner1@nhs.net",
    "ManagedBy" = "Research Software Design Authority",
    "Repository" = "https://github.com/lsc-sde/k8s-iac.git",
    "Budget - Billing Owner" = "healthierlsc.ICBAzureBillingAlerts@nhs.net",
    "Budget - Shared Resource" = "No",
    "Budget - Source" = "Revenue",
    "Budget - Cost Centre" = "TBC"
}
subscription_id="f227cc66-c370-426c-ae73-24d75a8ddc4d"
cluster_admin_ids = [ "8759908d-3bec-4c05-911b-0034b59ea017" ]
network_security_group_name = "nsg-lsc-uks-tresbx-snet-tre"
network_resource_group_name = "rg-lsc-uks-tresbx-network"
virtual_network_id = "/subscriptions/f227cc66-c370-426c-ae73-24d75a8ddc4d/resourceGroups/rg-lsc-uks-tresbx-network/providers/Microsoft.Network/virtualNetworks/vnet-lsc-uks-tresbx-spoke"
subnet_id = "/subscriptions/f227cc66-c370-426c-ae73-24d75a8ddc4d/resourceGroups/rg-lsc-uks-tresbx-network/providers/Microsoft.Network/virtualNetworks/vnet-lsc-uks-tresbx-spoke/subnets/snet-tre"
ip_rules = [
    "208.127.197.187" // not sure what this is
]
keyvault_allowed_ips = []
k8s_admin_group = "8759908d-3bec-4c05-911b-0034b59ea017"
enable_hub_dns = false
hub_subscription_id = "de97be38-945e-4824-a44b-5b101c0e048b"
private_zone_resource_group_name = "rg-icb-uks-plt-dns"
apply_nsg_rules = false
keyvault_purge_protection_enabled = true
defender_log_analytics_workspace_id = "/subscriptions/de97be38-945e-4824-a44b-5b101c0e048b/resourceGroups/rg-icb-uks-plt-logs/providers/Microsoft.OperationalInsights/workspaces/log-icb-uks-plt-log01"
environment_name = "sandbox"
dns_prefix="sandbox-"
dns_zone = "xlscsde.nhs.uk"
owners = [ 
    "88fb51fa-8fc5-4191-9a66-25c53b49519d", # Vishnu Chandrabalan
    "0cc02d86-3114-4f32-a161-3aea530a351f",  # Shaun Turner
    "5cb2e105-b160-46c5-a4b3-a40aab07fca2" # spn-treSandbox-pipelines
    ]
branch_name = "sandbox"
