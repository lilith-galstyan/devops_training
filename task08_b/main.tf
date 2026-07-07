data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
  tags     = var.tags
}

module "keyvault" {
  source = "./modules/keyvault"

  keyvault_name       = local.keyvault_name
  keyvault_sku        = var.keyvault_sku
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags
}

module "aci_redis" {
  source = "./modules/aci_redis"

  redis_aci_name             = local.redis_aci_name
  redis_aci_sku              = var.redis_aci_sku
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  tags                       = var.tags
  keyvault_id                = module.keyvault.id
  redis_hostname_secret_name = var.redis_hostname_secret_name
  redis_password_secret_name = var.redis_password_secret_name

  depends_on = [module.keyvault]
}

module "storage" {
  source = "./modules/storage"

  sa_name                = local.sa_name
  sa_replication_type    = var.sa_replication_type
  sa_container_name      = var.sa_container_name
  location               = azurerm_resource_group.rg.location
  resource_group_name    = azurerm_resource_group.rg.name
  tags                   = var.tags
  application_source_dir = "${path.module}/application"
}

module "acr" {
  source = "./modules/acr"

  acr_name            = local.acr_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  acr_sku             = var.acr_sku
  tags                = var.tags
  image_name          = var.image_name
  blob_url            = module.storage.blob_url
  sas_token           = module.storage.sas_token

  depends_on = [module.storage]
}

module "aks" {
  source = "./modules/aks"

  aks_name                      = local.aks_name
  location                      = azurerm_resource_group.rg.location
  resource_group_name           = azurerm_resource_group.rg.name
  tags                          = var.tags
  aks_node_pool_name            = var.aks_node_pool_name
  aks_node_pool_size            = var.aks_node_pool_size
  aks_node_pool_count           = var.aks_node_pool_count
  aks_node_pool_disk_type       = var.aks_node_pool_disk_type
  aks_node_pool_os_disk_size_gb = var.aks_node_pool_os_disk_size_gb
  acr_id                        = module.acr.id
  keyvault_id                   = module.keyvault.id

  depends_on = [module.keyvault, module.acr]
}

module "aca" {
  source = "./modules/aca"

  aca_name                      = local.aca_name
  aca_env_name                  = local.aca_env_name
  aca_workload_profile_type     = var.aca_workload_profile_type
  aca_env_workload_profile_type = var.aca_env_workload_profile_type
  location                      = azurerm_resource_group.rg.location
  resource_group_name           = azurerm_resource_group.rg.name
  tags                          = var.tags
  keyvault_id                   = module.keyvault.id
  acr_id                        = module.acr.id
  acr_login_server              = module.acr.login_server
  image_name                    = var.image_name
  image_tag                     = "latest"
  redis_hostname_secret_id      = module.aci_redis.redis_hostname_secret_id
  redis_password_secret_id      = module.aci_redis.redis_password_secret_id

  depends_on = [module.keyvault, module.acr, module.aci_redis]
}

module "k8s" {
  source = "./modules/k8s"

  acr_login_server           = module.acr.login_server
  image_name                 = var.image_name
  image_tag                  = "latest"
  aks_kv_access_identity_id  = module.aks.key_vault_secrets_provider_client_id
  kv_name                    = module.keyvault.name
  redis_url_secret_name      = var.redis_hostname_secret_name
  redis_password_secret_name = var.redis_password_secret_name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  k8s_manifests_path         = "${path.module}/k8s-manifests"

  depends_on = [module.aks, module.acr, module.aci_redis]
}