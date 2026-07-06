output "hostname" {
  value = azurerm_redis_cache.example.hostname
}

output "primary_access_key" {
  value     = azurerm_redis_cache.example.primary_access_key
  sensitive = true
}

output "ssl_port" {
  value = azurerm_redis_cache.example.ssl_port
}