unique_id        = "cmtr-iaco50xm-mod9"
location         = "East US"
rg_name          = "cmtr-iaco50xm-mod9-rg"
vnet_name        = "cmtr-iaco50xm-mod9-vnet"
vnet_space       = "10.0.0.0/16"
subnet_name      = "aks-snet"
subnet_space     = "10.0.0.0/24"
aks_cluster_name = "cmtr-iaco50xm-mod9-aks"
public_ip_name   = "cmtr-iaco50xm-mod9-pip"

aks_loadbalancer_ip = "4.255.71.208"

firewall_sku_name = "AZFW_VNet"
firewall_sku_tier = "Standard"
nginx_nat_port    = "80"

tags = {}