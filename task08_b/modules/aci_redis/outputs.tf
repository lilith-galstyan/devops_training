output "redis_fqdn" {
  description = "The FQDN of the Redis Azure Container Instance."
  value       = azurerm_container_group.redis.fqdn
}

output "redis_ip_address" {
  description = "The public IP address of the Redis Azure Container Instance."
  value       = azurerm_container_group.redis.ip_address
}

output "redis_hostname_secret_id" {
  description = "Key Vault Secret ID for the Redis hostname (used by ACA for KV secret references)."
  value       = azurerm_key_vault_secret.redis_hostname.id
}

output "redis_password_secret_id" {
  description = "Key Vault Secret ID for the Redis password (used by ACA for KV secret references)."
  value       = azurerm_key_vault_secret.redis_password.id
}
