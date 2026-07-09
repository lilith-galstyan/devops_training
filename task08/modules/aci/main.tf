resource "random_string" "dns" {
  length  = 6
  special = false
  upper   = false
}

resource "azurerm_container_group" "container" {
  name                = var.aci_name
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_address_type     = "Public"
  os_type             = "Linux"
  restart_policy      = var.restart_policy
  zones               = var.zone != "" ? [var.zone] : null
  tags                = var.tags
  sku                 = var.aci_sku
  dns_name_label      = "${var.aci_name}-${random_string.dns.result}"

  container {
    name   = var.aci_name
    image  = var.image
    cpu    = var.cpu_cores
    memory = var.memory_in_gb

    ports {
      port     = var.port
      protocol = "TCP"
    }

    environment_variables = {
      CREATOR        = "ACI"
      REDIS_PORT     = "6380"
      REDIS_SSL_MODE = "True"
    }

    secure_environment_variables = {
      REDIS_URL = var.redis_hostname
      REDIS_PWD = var.redis_primary_key
    }
  }

  image_registry_credential {
    server   = var.acr_login_server
    username = var.acr_admin_username
    password = var.acr_admin_password
  }
}