resource "azurerm_service_plan" "this" {
  name                = var.name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  os_type             = var.os_type
  sku_name            = var.sku
  worker_count        = var.worker_count
  tags                = var.tags
}