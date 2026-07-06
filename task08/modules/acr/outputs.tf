output "login_server" {
  value = azurerm_container_registry.acr.login_server
  description = "The login server of the Azure Container Registry (ACR)."
}

output "id" {
  value = azurerm_container_registry.acr.id
  description = "The ID of the Azure Container Registry (ACR)."
}

output "admin_username" {
  value = azurerm_container_registry.acr.admin_username
  description = "The admin username of the Azure Container Registry (ACR)."
}

output "admin_password" {
  value     = azurerm_container_registry.acr.admin_password
  description = "The admin password of the Azure Container Registry (ACR)."
  sensitive = true
}