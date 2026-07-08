output "id" {
  description = "The ID of the Azure Container Registry."
  value       = azurerm_container_registry.acr.id
}

output "login_server" {
  description = "The login server URL of the Azure Container Registry."
  value       = azurerm_container_registry.acr.login_server
}

output "admin_username" {
  description = "Admin username for the Azure Container Registry."
  value       = azurerm_container_registry.acr.admin_username
}

output "admin_password" {
  description = "Admin password for the Azure Container Registry."
  value       = azurerm_container_registry.acr.admin_password
  sensitive   = true
}
