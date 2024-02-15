location = "uksouth"
prefix = "lscsdeprod"
tags = {
    "Environment" = "Production",
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
subscription_id = "4e36d23a-0f01-44f6-b3b1-54e033f2b1f1"
cluster_admin_ids = [ "6df08821-b30d-434b-b2bb-f6bc1191c29b" ]
network_security_group_name = "nsg-lsc-uks-treprod-snet-tre"
network_resource_group_name = "rg-lsc-uks-treprod-network"
virtual_network_id = "/subscriptions/4e36d23a-0f01-44f6-b3b1-54e033f2b1f1/resourceGroups/rg-lsc-uks-treprod-network/providers/Microsoft.Network/virtualNetworks/vnet-lsc-uks-treprod-spoke"
subnet_id = "/subscriptions/4e36d23a-0f01-44f6-b3b1-54e033f2b1f1/resourceGroups/rg-lsc-uks-treprod-network/providers/Microsoft.Network/virtualNetworks/vnet-lsc-uks-treprod-spoke/subnets/snet-tre"
ip_rules = [
    "208.127.197.187" // not sure what this is
]
keyvault_allowed_ips = []
k8s_admin_group = "06248ad4-0f92-4132-8f96-0f614978b1de"
enable_hub_dns = false
hub_subscription_id = "de97be38-945e-4824-a44b-5b101c0e048b"
private_zone_resource_group_name = "rg-icb-uks-plt-dns"
apply_nsg_rules = false
keyvault_purge_protection_enabled = true
defender_log_analytics_workspace_id = "/subscriptions/de97be38-945e-4824-a44b-5b101c0e048b/resourceGroups/rg-icb-uks-plt-logs/providers/Microsoft.OperationalInsights/workspaces/log-icb-uks-plt-log01"
environment_name = "prod"
dns_prefix=""
dns_zone = "xlscsde.nhs.uk"
kubernetes_sku_tier = "Standard"