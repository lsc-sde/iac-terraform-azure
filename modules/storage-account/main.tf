resource "azurerm_storage_account" "main" {
    name = local.name
    resource_group_name = var.resource_group_name
    location = var.location

    account_tier = "Standard"  
    account_replication_type = "GRS"
    
    tags = merge(var.tags, {
        "TF.Type" = "azurerm_storage_account"
        "TF.Resource" = "main"
        "TF.Module" = "storage-account",
    })
}