output "hostname" {
  value       = azurerm_redis_cache.example.hostname
  description = "The hostname of the Redis cache."
}

output "primary_access_key" {
  value       = azurerm_redis_cache.example.primary_access_key
  description = "The primary access key of the Redis cache."
  sensitive   = true
}

output "ssl_port" {
  value       = azurerm_redis_cache.example.ssl_port
  description = "The SSL port of the Redis cache."
}