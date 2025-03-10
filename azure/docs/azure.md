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

```bash
terraform init
terraform plan
terraform apply
```

Please note that because of the way azure P2S VPN works, the details of the VPN will change each time it is provisioned, as a result you will need to import the VPN configuration every time the gateway is provisioned. You can get the vpn client configuration using the following command in azure cli

```bash
az network vnet-gateway vpn-client generate -g test-network-hub-network-rg -n test-network-vpngw -o tsv
```

This will output a URL to the Azure VPN Configuration. You can then download this file which should download as vpnclientconfiguration.zip

This zip file will contain two folders:

* AzureVPN
* Generic

The file *azurevpnconfig.xml* in AzureVPN can be imported into Azure VPN client and used to connect to the environment.

### Terraform State
Once you have a network in place, you will need somewhere to store your terraform backend in state. You can either use an existing storage or you can provision a new storage account using the terraform in [./azure/02-state-store](./azure/02-state-store/)

### Core Infrastructure
Once you've got your network and terraform state sorted out you can provision the infrastructure using the core terraform scripts [./azure/03-core-infrastructure](./azure/03-core-infrastructure/).
        