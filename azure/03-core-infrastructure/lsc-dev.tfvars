location = "uksouth"
prefix = "lscsdedev"
tags = {
    "Environment" = "Dev",
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
subscription_id = "a700d992-ab84-4ca9-bac0-84b37eb2047d"
cluster_admin_ids = [ "6df08821-b30d-434b-b2bb-f6bc1191c29b" ]
network_security_group_name = "nsg-lsc-uks-tredev-snet-tre"
network_resource_group_name = "rg-lsc-uks-tredev-network"
virtual_network_id = "/subscriptions/a700d992-ab84-4ca9-bac0-84b37eb2047d/resourceGroups/rg-lsc-uks-tredev-network/providers/Microsoft.Network/virtualNetworks/vnet-lsc-uks-tredev-spoke"
subnet_id = "/subscriptions/a700d992-ab84-4ca9-bac0-84b37eb2047d/resourceGroups/rg-lsc-uks-tredev-network/providers/Microsoft.Network/virtualNetworks/vnet-lsc-uks-tredev-spoke/subnets/snet-tre"
ip_rules = [
    "208.127.197.187" // not sure what this is
]
keyvault_allowed_ips = []
k8s_admin_group = "6df08821-b30d-434b-b2bb-f6bc1191c29b"
enable_hub_dns = false
hub_subscription_id = "de97be38-945e-4824-a44b-5b101c0e048b"
private_zone_resource_group_name = "rg-icb-uks-plt-dns"
apply_nsg_rules = false
keyvault_purge_protection_enabled = true
defender_log_analytics_workspace_id = "/subscriptions/de97be38-945e-4824-a44b-5b101c0e048b/resourceGroups/rg-icb-uks-plt-logs/providers/Microsoft.OperationalInsights/workspaces/log-icb-uks-plt-log01"
environment_name = "dev"
dns_prefix="dev-"
dns_zone = "xlscsde.nhs.uk"
owners = [ 
    "88fb51fa-8fc5-4191-9a66-25c53b49519d", # Vishnu Chandrabalan
    "0cc02d86-3114-4f32-a161-3aea530a351f",  # Shaun Turner
    "08f58465-f402-46c8-80b6-e308a0e90ce6" # spn-treDev-pipelines
    ]