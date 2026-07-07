resource "azurerm_redis_cache" "example" {
  name                 = var.redis_name
  location             = var.location
  resource_group_name  = var.resource_group_name
  capacity             = var.redis_capacity
  family               = var.redis_sku_family
  sku_name             = var.redis_sku
  non_ssl_port_enabled = false
  minimum_tls_version  = "1.2"
  tags                 = var.tags

  redis_configuration {
  }
}

resource "azurerm_key_vault_secret" "redis_hostname" {
  name         = var.redis_hostname_secret_name
  value        = azurerm_redis_cache.example.hostname
  key_vault_id = var.keyvault_id
}

resource "azurerm_key_vault_secret" "redis_primary_key" {
  name         = var.redis_primary_key_secret_name
  value        = azurerm_redis_cache.example.primary_access_key
  key_vault_id = var.keyvault_id
}