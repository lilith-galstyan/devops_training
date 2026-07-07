resource "random_password" "redis_password" {
  length  = 20
  special = false
}

resource "random_string" "dns" {
  length  = 6
  special = false
  upper   = false
}

resource "azurerm_container_group" "redis" {
  name                = var.redis_aci_name
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_address_type     = "Public"
  os_type             = "Linux"
  dns_name_label      = "${var.redis_aci_name}-${random_string.dns.result}"
  sku                 = var.redis_aci_sku
  tags                = var.tags

  container {
    name = "redis"
    # Microsoft Artifact Registry mirror, used instead of Docker Hub
    # due to Docker Hub pull-rate limitations from ACI.
    image  = "mcr.microsoft.com/mirror/docker/library/redis:7.0"
    cpu    = 1
    memory = 1.5

    commands = [
      "redis-server",
      "--protected-mode", "no",
      "--requirepass", random_password.redis_password.result
    ]

    ports {
      port     = 6379
      protocol = "TCP"
    }
  }
}

resource "azurerm_key_vault_secret" "redis_hostname" {
  name         = var.redis_hostname_secret_name
  value        = azurerm_container_group.redis.fqdn
  key_vault_id = var.keyvault_id
}

resource "azurerm_key_vault_secret" "redis_password" {
  name         = var.redis_password_secret_name
  value        = random_password.redis_password.result
  key_vault_id = var.keyvault_id
}
