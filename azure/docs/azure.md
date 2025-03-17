---
title: Azure
layout: page
parent: Terraform
grand_parent: Infrastructure as Code
has_children: true
---

# Introduction
This repository provides terraform IaC scripts to deploy a new version of the SDE environment into azure (or other environments).

To future proof the repository the script is split into pathways for the environment it is to be hosted in, starting with azure. Equivalent scripts can then be created for alternative environments

Deployments of the infrastructure should be handled via git actions and deployed using job runners within the environment. However there are some manual tasks which may also need to be adhered to.

# Microsoft Azure
Deployment in this environment will create the following infrastructure

```mermaid
flowchart LR
    
    subgraph Resource Group
        
        Subnet[[Environment Subnet]] -->  AppGateway[App Gateway]

        AppGateway ~~~ Secret1(Storage Account Secret)
        AppGateway ~~~ Keda[/Keda/]
        AppGateway --> Nginx[/Nginx/]
        AppGateway ~~~ Prefect[/Prefect/]
        AppGateway ~~~ AzPlugins[\Azure Plugins\]
        
        subgraph Kubernetes CLuster
            Secret1 ~~~ Secret1
            Nginx ~~~ Nginx 
            Keda ~~~ Keda
            Prefect ~~~ Prefect
            AzPlugins ~~~ AzPlugins
        end

        AzPlugins -->Diagnostics[Log Analytics Workspace]
        Subnet -->|Service Endpoint|Storage[Storage Accounts]
        Subnet -->|Service Endpoint|KeyVault[Key Vault]
    end

    Storage --> Secret1

```

## Getting Started
### Networking Consideration
As the solution is designed for use within NHS networks, the expectation is that the network will be configured in a hub/spoke pattern. With the hub and spoke network VNET being build already and linked in via environment variables.

```mermaid
flowchart LR

    VPN[Virtual Network Gateway] --> Hub((Hub Network)) --> Spoke((Spoke Network)) --> Subnet[[Environment Subnet]] --> Cluster([Kubernetes Cluster])

```

if you don't have a hub/spoke design to work from, you can set one up using the terraform in [./azure/01-hub-spoke-test](azure/01-hub-spoke-test).

To run this from your local machine, you must be logged in to az cli.

You will need to create an app registration inside of azure, this will be used to assign the relevant permissions to the service principle for deploying the terraform, this allows us to test the permissions overlay as part of the deployment.



You will need to configure a tfvars file for your environment

```
hub_address_space = "10.26.100.128/26"
location = "uksouth"
prefix = "test-network"
spoke_address_space = "10.26.104.0/25"
vpn_client_prefix = "10.0.242.0/24"
tenant_name = "LANDERTRE.onmicrosoft.com"
admin_password = "BadgerMushroom@1556"
private_dns_zone_name = "xlscsde.nhs.uk"
service_principal_id = "d4b1fc84-f1a1-4522-82d3-23c48ffb2c4c" # This is the object ID of the enterprise application for the app registration you created
```

Once this is applied you can run this using the tfvar files you created. Please note that even if this is run as a global administrator role you will need to assign the network contributor role to the executing user. This is because of changes in entra ID

```bash
terraform init
terraform plan --var-file=./variables/default.tfvars
terraform apply --var-file=./variables/default.tfvars
```

Please note that this will take approximately 20-30 minutes to deploy. 

Once it has completed it should output a load of variables giving information that can be used by scripts later. You should save this for later.

```
Outputs:

blob_storage_private_dns_zone_id = "/subscriptions/8580f07e-e369-4617-89c0-330764bf2118/resourceGroups/test-network-hub-network-rg/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net"
dns_server_ip_address = "10.26.100.164"
file_share_private_dns_zone_id = "/subscriptions/8580f07e-e369-4617-89c0-330764bf2118/resourceGroups/test-network-hub-network-rg/providers/Microsoft.Network/privateDnsZones/privatelink.file.core.windows.net"
hub_resource_group = "test-network-hub-network-rg"
hub_subnet_id = "/subscriptions/8580f07e-e369-4617-89c0-330764bf2118/resourceGroups/test-network-hub-network-rg/providers/Microsoft.Network/virtualNetworks/test-network-hub-network-vnet/subnets/test-network-hub-network-subnet"
hub_vnet_id = "/subscriptions/8580f07e-e369-4617-89c0-330764bf2118/resourceGroups/test-network-hub-network-rg/providers/Microsoft.Network/virtualNetworks/test-network-hub-network-vnet"
our_private_dns_zone_id = "/subscriptions/8580f07e-e369-4617-89c0-330764bf2118/resourceGroups/test-network-hub-network-rg/providers/Microsoft.Network/privateDnsZones/xlscsde.nhs.uk"
spoke_resource_group = "test-network-spoke-network-vnet"
spoke_subnet_id = "/subscriptions/8580f07e-e369-4617-89c0-330764bf2118/resourceGroups/test-network-spoke-network-rg/providers/Microsoft.Network/virtualNetworks/test-network-spoke-network-vnet/subnets/test-network-spoke-network-subnet"
spoke_vnet_id = "/subscriptions/8580f07e-e369-4617-89c0-330764bf2118/resourceGroups/test-network-spoke-network-rg/providers/Microsoft.Network/virtualNetworks/test-network-spoke-network-vnet"
subscription_id = "8580f07e-e369-4617-89c0-330764bf2118"
tenant_id = "ce97ca89-9ea2-41d7-81f0-fc095a5aac1f"
```

You can get the vpn client configuration using the following command in azure cli

```bash
az network vnet-gateway vpn-client generate -g test-network-hub-network-rg -n test-network-vpngw -o tsv
```
This will output a URL to the Azure VPN Configuration. You can then download this file which should download as vpnclientconfiguration.zip

This zip file will contain two folders:

* AzureVPN
* Generic

The file *azurevpnconfig.xml* in AzureVPN can be imported into Azure VPN client and used to connect to the environment. Azure VPN Client can be downloaded from the Microsoft Store.

Once you've downloaded and configured the Azure VPN you will need to connect to it in order to progress to the next phase.

Please be aware that because of the way azure P2S VPN works, the details of the VPN will change each time it is provisioned, as a result you will need to import the VPN configuration every time the gateway is provisioned. 

### Terraform State
Once you have a network in place, you will need somewhere to store your terraform backend in state. You can either use an existing storage or you can provision a new storage account using the terraform in [./azure/02-state-store](./azure/02-state-store/)

Again, you will need to fashion a tf vars file to go with this before you can apply it:

```

```

### Core Infrastructure
Once you've got your network and terraform state sorted out you can provision the infrastructure using the core terraform scripts [./azure/03-core-infrastructure](./azure/03-core-infrastructure/).
        