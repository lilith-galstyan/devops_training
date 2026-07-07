resources_name_prefix = "cmtr-iaco50xm-mod8b"
location              = "eastus"

tags = {
  Creator = "lilit_galstyan@epam.com"
}

keyvault_sku               = "standard"
redis_hostname_secret_name = "redis-hostname"
redis_password_secret_name = "redis-password"

redis_aci_sku = "Standard"

sa_replication_type = "LRS"
sa_container_name   = "app-content"

acr_sku    = "Basic"
image_name = "cmtr-iaco50xm-mod8b-app"

aks_node_pool_name            = "system"
aks_node_pool_count           = 1
aks_node_pool_size            = "Standard_D2ads_v6"
aks_node_pool_disk_type       = "Ephemeral"
aks_node_pool_os_disk_size_gb = 100

aca_env_workload_profile_type = "Consumption"
aca_workload_profile_type     = "Consumption"