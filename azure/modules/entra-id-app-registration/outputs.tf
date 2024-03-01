output "client_id" {
  value = azuread_application.main.client_id
  depends_on = [ 
    azuread_service_principal_password.main 
    ]
}

output "object_id" {
  value = azuread_application.main.object_id
  depends_on = [ 
    azuread_service_principal_password.main 
    ]
}