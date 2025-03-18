https://lscsdesandboxenvironment.blob.core.windows.net/tfstate/temp/terraform.tfstate?sp=r&st=2024-01-11T10:21:59Z&se=2024-01-11T18:21:59Z&spr=https&sv=2022-11-02&sr=b&sig=mqmG8eFS7hVLaqND5ahL9W3PGI0v902C9UwCZeoLRIA%3D

# Providers
```bash
az provider register --namespace Microsoft.Sql
az provider register --namespace Microsoft.OperationalInsights
az provider register --namespace Microsoft.ContainerRegistry
az provider register --namespace Microsoft.ContainerService
az provider register --namespace Microsoft.Storage
az provider register --namespace Microsoft.OperationsManagement
az provider register --namespace Microsoft.KeyVault
az provider register --namespace Microsoft.KubernetesConfiguration
az provider register --namespace Microsoft.DBforPostgreSQL
```


# Defaults for LSCSDE environments
```
export ARM_SUBSCRIPTION_ID="f227cc66-c370-426c-ae73-24d75a8ddc4d"
export ARM_RESOURCE_GROUP_NAME="lscsdesbxstate-rg"
export ARM_STORAGE_ACCOUNT_NAME="lscsdesbxstate8ddbeyve"
export ARM_CONTAINER_NAME="tfstate"
export ARM_KEY="core-infrastructure.tfstate"
```

You should then be able to run the terraform init command as follows:

```bash
terraform init -backend-config="subscription_id=${ARM_SUBSCRIPTION_ID}" -backend-config="resource_group_name=${ARM_RESOURCE_GROUP_NAME}" -backend-config="storage_account_name=${ARM_STORAGE_ACCOUNT_NAME}" -backend-config="container_name=${ARM_CONTAINER_NAME}" -backend-config="key=${ARM_KEY}"
```