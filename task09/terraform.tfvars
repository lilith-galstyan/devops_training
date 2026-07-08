unique_id        = "cmtr-iaco50xm-mod9"
location         = "East US"
rg_name          = "cmtr-iaco50xm-mod9-rg"
vnet_name        = "cmtr-iaco50xm-mod9-vnet"
vnet_space       = "10.0.0.0/16"
subnet_name      = "aks-snet"
subnet_space     = "10.0.0.0/24"
aks_cluster_name = "cmtr-iaco50xm-mod9-aks"
public_ip_name   = "cmtr-iaco50xm-mod9-pip"

afw_subnet_address_prefix = "10.0.4.0/26"

aks_loadbalancer_ip = "40.88.237.74"

tags = {
  Creator = "lilit_galstyan@epam.com"
}