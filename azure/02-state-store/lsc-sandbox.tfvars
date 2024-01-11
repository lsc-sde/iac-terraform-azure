location = "uksouth"
prefix = "lscsdesbxstate"
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
subnet_id = "/subscriptions/f227cc66-c370-426c-ae73-24d75a8ddc4d/resourceGroups/rg-lsc-uks-tresbx-network/providers/Microsoft.Network/virtualNetworks/vnet-lsc-uks-tresbx-spoke/subnets/snet-tre"
ip_rules = [
    "208.127.197.187" // not sure what this is
]
hub_subscription_id = "de97be38-945e-4824-a44b-5b101c0e048b"
admin_group_id = "8759908d-3bec-4c05-911b-0034b59ea017"