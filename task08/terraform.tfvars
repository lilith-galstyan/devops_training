resources_name_prefix = "cmtr-iaco50xm-mod8"
location              = "East US"

tags = {
  Creator = "lilit_galstyan@epam.com"
}

# ACR
acr_sku    = "Basic"
image_name = "cmtr-iaco50xm-mod8-app"

# ACI
aci_sku = "Standard"
port    = 8080


# AKS
aks_node_pool_name      = "system"
aks_node_pool_count     = 1
aks_node_pool_size      = "Standard_D2ads_v6"
aks_node_pool_disk_type = "Ephemeral"

# Key Vault
keyvault_sku                  = "standard"
redis_hostname_secret_name    = "redis-hostname"
redis_primary_key_secret_name = "redis-primary-key"

# Redis
redis_capacity   = 2
redis_sku        = "Basic"
redis_sku_family = "C"
github_repo_url  = "https://github.com/lilith-galstyan/devops_training.git"
