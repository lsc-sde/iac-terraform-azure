locals {
    assignable_roles = {
        "Key Vault Data Access Administrator" = "8b54135c-b56d-4d72-a534-26097cfdc8d8",
        "Key Vault Crypto Officer" = "14b46e9e-c2b7-41b4-b07b-48a6ebf60603",
        "Contributor" = "b24988ac-6180-42a0-ab88-20f7382dd24c",
        "Managed Identity Operator" = "f1a07417-d97a-45cb-824c-7a7467783830",
        "Network Contributor" = "4d97b98b-1d4f-4787-a291-c67834d212e7",
        "Private DNS Zone Contributor" = "b12aa53e-6015-4669-85d0-8515ebb3ae7f",
        "AcrPull" = "7f951dda-4ed3-4680-a7ca-43fe172d538d"
    }
    assignable_role_ids = join(", ", values(local.assignable_roles))
}