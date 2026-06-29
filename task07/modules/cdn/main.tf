resource "azurerm_cdn_frontdoor_profile" "my_front_door" {
  name                = var.frontdoor_profile_name
  resource_group_name = var.resource_group_name
  sku_name            = var.frontdoor_profile_sku
  tags                = var.tags
}

resource "azurerm_cdn_frontdoor_endpoint" "my_endpoint" {
  name                     = var.frontdoor_endpoint_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.my_front_door.id
  tags                     = var.tags
}

resource "azurerm_cdn_frontdoor_origin_group" "my_origin_group" {
  name                     = var.frontdoor_origin_group_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.my_front_door.id
  session_affinity_enabled = false

  load_balancing {}
}

resource "azurerm_cdn_frontdoor_origin" "my_app_service_origin" {
  name                          = var.frontdoor_origin_name
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.my_origin_group.id

  enabled                        = true
  host_name                      = var.storage_account_host
  http_port                      = 80
  https_port                     = 443
  origin_host_header             = var.storage_account_host
  priority                       = 1
  weight                         = 1000
  certificate_name_check_enabled = true
}

resource "azurerm_cdn_frontdoor_route" "my_route" {
  name                          = var.frontdoor_route_name
  cdn_frontdoor_endpoint_id     = azurerm_cdn_frontdoor_endpoint.my_endpoint.id
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.my_origin_group.id
  cdn_frontdoor_origin_ids      = [azurerm_cdn_frontdoor_origin.my_app_service_origin.id]

  supported_protocols    = ["Http", "Https"]
  patterns_to_match      = ["/mycontainer/*"]
  forwarding_protocol    = "HttpsOnly"
  link_to_default_domain = true
  https_redirect_enabled = true
}