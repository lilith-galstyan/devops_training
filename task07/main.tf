import {
  to = azurerm_resource_group.this
  id = var.resource_group_id
}

import {
  to = azurerm_storage_account.this
  id = var.storage_account_id
}


resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}


resource "azurerm_storage_account" "this" {
  name                = var.storage_account_name
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location

  account_tier             = "Standard"
  account_replication_type = "LRS"

  allow_nested_items_to_be_public  = false
  cross_tenant_replication_enabled = false

  tags = var.tags
}


module "cdn" {
  source = "./modules/cdn"

  resource_group_name         = azurerm_resource_group.this.name
  frontdoor_profile_name      = var.frontdoor_profile_name
  frontdoor_profile_sku       = var.frontdoor_profile_sku
  frontdoor_endpoint_name     = var.frontdoor_endpoint_name
  frontdoor_origin_group_name = var.frontdoor_origin_group_name
  frontdoor_origin_name       = var.frontdoor_origin_name
  frontdoor_route_name        = var.frontdoor_route_name
  storage_account_host        = local.storage_account_host
  tags                        = var.tags
}
