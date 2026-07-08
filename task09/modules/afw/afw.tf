resource "azurerm_subnet" "afw" {
  name                 = local.afw_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [var.afw_subnet_address_prefix]
}


resource "azurerm_public_ip" "afw" {
  name                = local.afw_pip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags

  lifecycle {
    create_before_destroy = true
  }
}


resource "azurerm_firewall" "this" {
  name                = local.afw_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.firewall_sku_name
  sku_tier            = var.firewall_sku_tier
  tags                = var.tags

  ip_configuration {
    name                 = local.afw_ip_config_name
    subnet_id            = azurerm_subnet.afw.id
    public_ip_address_id = azurerm_public_ip.afw.id
  }
}


resource "azurerm_route_table" "afw" {
  name                = local.route_table_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  route {
    name                   = local.default_route_name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = azurerm_firewall.this.ip_configuration[0].private_ip_address
  }
}


resource "azurerm_subnet_route_table_association" "aks" {
  subnet_id      = var.aks_subnet_id
  route_table_id = azurerm_route_table.afw.id
}


resource "azurerm_firewall_application_rule_collection" "aks_egress" {
  name                = local.app_rule_collection_name
  azure_firewall_name = azurerm_firewall.this.name
  resource_group_name = var.resource_group_name
  priority            = 100
  action              = "Allow"

  dynamic "rule" {
    for_each = { "${var.unique_id}-aks-fqdn-tags" = local.aks_fqdn_tags }
    content {
      name             = rule.key
      source_addresses = ["*"]
      fqdn_tags        = rule.value
    }
  }

  rule {
    name             = "${var.unique_id}-aks-required-fqdns"
    source_addresses = ["*"]
    target_fqdns     = local.aks_allowed_fqdns

    protocol {
      port = "443"
      type = "Https"
    }
    protocol {
      port = "80"
      type = "Http"
    }
  }
}


resource "azurerm_firewall_network_rule_collection" "aks_egress" {
  name                = local.network_rule_collection_name
  azure_firewall_name = azurerm_firewall.this.name
  resource_group_name = var.resource_group_name
  priority            = 200
  action              = "Allow"

  dynamic "rule" {
    for_each = local.aks_network_rules
    content {
      name                  = "${var.unique_id}-${rule.key}"
      source_addresses      = ["*"]
      destination_ports     = rule.value.destination_ports
      destination_addresses = rule.value.destination_addresses
      protocols             = rule.value.protocols
    }
  }
}

resource "azurerm_firewall_nat_rule_collection" "nginx_dnat" {
  name                = local.nat_rule_collection_name
  azure_firewall_name = azurerm_firewall.this.name
  resource_group_name = var.resource_group_name
  priority            = 100
  action              = "Dnat"

  rule {
    name                  = "${var.unique_id}-nginx-dnat"
    source_addresses      = ["*"]
    destination_ports     = [var.nginx_nat_port]
    destination_addresses = [azurerm_public_ip.afw.ip_address]
    translated_address    = var.aks_loadbalancer_ip
    translated_port       = var.nginx_nat_port
    protocols             = ["TCP"]
  }
}