data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
  tags     = var.tags
}

module "acr" {
  source = "./modules/acr"

  acr_name            = local.acr_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  acr_sku             = var.acr_sku
  tags                = var.tags
  github_repo_url     = var.github_repo_url
  git_pat             = var.git_pat
  image_name          = var.image_name
}

module "keyvault" {
  source = "./modules/keyvault"

  keyvault_name       = local.keyvault_name
  keyvault_sku        = var.keyvault_sku
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags
}

module "redis" {
  source = "./modules/redis"

  redis_name                    = local.redis_name
  location                      = azurerm_resource_group.rg.location
  resource_group_name           = azurerm_resource_group.rg.name
  redis_sku                     = var.redis_sku
  redis_sku_family              = var.redis_sku_family
  redis_capacity                = var.redis_capacity
  tags                          = var.tags
  redis_hostname_secret_name    = var.redis_hostname_secret_name
  redis_primary_key_secret_name = var.redis_primary_key_secret_name
  keyvault_id                   = module.keyvault.id
  depends_on                    = [module.keyvault]

}

data "azurerm_key_vault_secret" "redis_hostname" {
  name         = var.redis_hostname_secret_name
  key_vault_id = module.keyvault.id
  depends_on   = [module.redis]
}

data "azurerm_key_vault_secret" "redis_primary_key" {
  name         = var.redis_primary_key_secret_name
  key_vault_id = module.keyvault.id
  depends_on   = [module.redis]
}

module "aci" {
  source = "./modules/aci"

  aci_name            = local.aci_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  restart_policy      = var.restart_policy
  zone                = var.zone
  aci_sku             = var.aci_sku
  cpu_cores           = var.cpu_cores
  memory_in_gb        = var.memory_in_gb
  port                = var.port
  image               = "${module.acr.login_server}/${var.image_name}:latest"
  tags                = var.tags

  redis_hostname    = data.azurerm_key_vault_secret.redis_hostname.value
  redis_primary_key = data.azurerm_key_vault_secret.redis_primary_key.value

  acr_login_server   = module.acr.login_server
  acr_admin_username = module.acr.admin_username
  acr_admin_password = module.acr.admin_password
}

module "aks" {
  source = "./modules/aks"

  aks_name                = local.aks_name
  location                = azurerm_resource_group.rg.location
  resource_group_name     = azurerm_resource_group.rg.name
  tags                    = var.tags
  aks_node_pool_name      = var.aks_node_pool_name
  aks_node_pool_size      = var.aks_node_pool_size
  aks_node_pool_count     = var.aks_node_pool_count
  aks_node_pool_disk_type = var.aks_node_pool_disk_type


  acr_id      = module.acr.id
  keyvault_id = module.keyvault.id
}

# Kubernetes

resource "kubectl_manifest" "secret_provider" {
  yaml_body = templatefile("${path.module}/k8s-manifests/secret-provider.yaml.tftpl", {
    aks_kv_access_identity_id  = module.aks.key_vault_secrets_provider_client_id
    kv_name                    = module.keyvault.name
    redis_url_secret_name      = var.redis_hostname_secret_name
    redis_password_secret_name = var.redis_primary_key_secret_name
    tenant_id                  = data.azurerm_client_config.current.tenant_id
  })

  depends_on = [module.aks, module.redis]
}

resource "kubectl_manifest" "deployment" {
  yaml_body = templatefile("${path.module}/k8s-manifests/deployment.yaml.tftpl", {
    acr_login_server = module.acr.login_server
    app_image_name   = var.image_name
    image_tag        = "latest"
  })

  wait_for {
    field {
      key   = "status.availableReplicas"
      value = "1"
    }
  }

  depends_on = [kubectl_manifest.secret_provider]
}

resource "kubectl_manifest" "service" {
  yaml_body = file("${path.module}/k8s-manifests/service.yaml")

  wait_for {
    field {
      key        = "status.loadBalancer.ingress.[0].ip"
      value      = "^(\\d+(\\.|$)){4}"
      value_type = "regex"
    }
  }

  depends_on = [kubectl_manifest.deployment]
}



data "kubernetes_service" "app_service" {
  metadata {
    name      = "redis-flask-app-service"
    namespace = "default"
  }

  depends_on = [kubectl_manifest.service]
}