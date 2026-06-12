location             = "eastus"
resource_group_name  = "cmaz-iaco50xm-mod3-rg"
storage_account_name = "cmaziaco50xmsa"
vnet_name            = "cmaz-iaco50xm-mod3-vnet"

vnet_address_space       = ["10.0.0.0/16"]
subnet_frontend_name     = "frontend"
subnet_frontend_prefixes = ["10.0.1.0/24"]
subnet_backend_name      = "backend"
subnet_backend_prefixes  = ["10.0.2.0/24"]

creator_tag = "lilit_galstyan@epam.com"