data "azurerm_resource_group" "this" {
  name = var.rg_name
}

data "azurerm_virtual_network" "this" {
  name                = var.vnet_name
  resource_group_name = var.rg_name
}

data "azurerm_subnet" "aks" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.rg_name
}

data "azurerm_kubernetes_cluster" "this" {
  name                = var.aks_cluster_name
  resource_group_name = var.rg_name
}


module "afw" {
  source = "./modules/afw"

  unique_id                 = var.unique_id
  location                  = var.location
  resource_group_name       = data.azurerm_resource_group.this.name
  vnet_name                 = data.azurerm_virtual_network.this.name
  afw_subnet_address_prefix = local.afw_subnet_address_prefix
  aks_subnet_id             = data.azurerm_subnet.aks.id
  public_ip_name            = var.public_ip_name
  aks_loadbalancer_ip       = var.aks_loadbalancer_ip
  firewall_sku_name         = var.firewall_sku_name
  firewall_sku_tier         = var.firewall_sku_tier
  nginx_nat_port            = var.nginx_nat_port
  tags                      = local.common_tags
}


data "azurerm_resources" "aks_nsg" {
  resource_group_name = data.azurerm_kubernetes_cluster.this.node_resource_group
  type                = "Microsoft.Network/networkSecurityGroups"
}


resource "azurerm_network_security_rule" "allow_fw_to_lb" {
  name                        = local.fw_to_lb_nsg_rule_name
  priority                    = 400
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = module.afw.firewall_public_ip
  destination_address_prefix  = var.aks_loadbalancer_ip
  resource_group_name         = data.azurerm_kubernetes_cluster.this.node_resource_group
  network_security_group_name = data.azurerm_resources.aks_nsg.resources[0].name
}