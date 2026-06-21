variable "name" {
  description = "The name of the Windows Web App"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the Web App will be deployed"
  type        = string
}

variable "resource_group_location" {
  description = "The Azure region where the Web App will be deployed"
  type        = string
}

variable "service_plan_id" {
  description = "The ID of the App Service Plan that will host this Web App"
  type        = string
}

variable "ip_restrictions" {
  description = "List of IP restriction rules to apply to the Web App"
  type = list(object({
    name        = string
    priority    = number
    action      = string
    ip_address  = optional(string)
    service_tag = optional(string)
  }))
}

variable "tags" {
  description = "Tags to apply to the Web App"
  type        = map(string)
  default     = {}
}

variable "ip_restriction_default_action" {
  description = "Default action for traffic that doesn't match any IP restriction rule"
  type        = string
  default     = "Deny"
}