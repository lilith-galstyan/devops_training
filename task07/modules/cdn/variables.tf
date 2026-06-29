variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "location" {
  description = "Region where the resource group is located."
  type        = string
}

variable "frontdoor_profile_name" {
  description = "CDN Front Door profile name."
  type        = string
}

variable "frontdoor_endpoint_name" {
  description = "CDN Front Door endpoint name."
  type        = string
}

variable "frontdoor_profile_sku" {
  description = "CDN Front Door profile SKU."
  type        = string
}

variable "frontdoor_origin_group_name" {
  description = "CDN Front Door origin group name."
  type        = string
}

variable "frontdoor_origin_name" {
  description = "CDN Front Door origin name."
  type        = string
}

variable "frontdoor_route_name" {
  description = "CDN Front Door route name."
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the resources."
  type        = map(string)
}