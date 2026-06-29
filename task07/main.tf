import {
  to = azurerm_resource_group.this
  id = "/subscriptions/7221393f-4130-48b0-a27e-8bb90abc742f/resourceGroups/cmtr-iaco50xm-mod7-rg"
}

import {
  to = azurerm_storage_account.this
  id = "/subscriptions/7221393f-4130-48b0-a27e-8bb90abc742f/resourceGroups/cmtr-iaco50xm-mod7-rg/providers/Microsoft.Storage/storageAccounts/cmtriaco50xmmod7sa"
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
  storage_account_filename    = var.storage_account_filename
  tags                        = var.tags
}
