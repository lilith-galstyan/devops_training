#resource groups

variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
  }))
  description = "A map of resource group objects"
}

#app service plans

variable "app_service_plans" {
  description = "Map of App Service Plan configurations"
  type = map(object({
    name         = string
    sku          = string
    worker_count = number
  }))
}

#app services

variable "app_services" {
  description = "Map of App Service configurations"
  type = map(object({
    name = string
  }))
}

variable "allow_ip_rule_name" {
  description = "Name of the access restriction rule that allows the verification agent IP"
  type        = string
}

variable "allow_tm_rule_name" {
  description = "Name of the access restriction rule that allows Traffic Manager"
  type        = string
}

variable "verification_agent_ip" {
  description = "IP address of the verification agent allowed to access the Web Apps"
  type        = string
}

variable "tm_service_tag" {
  description = "Service tag used to allow Traffic Manager traffic to the Web Apps"
  type        = string
  default     = "AzureTrafficManager"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "traffic_manager_name" {
  description = "The name of the Traffic Manager profile"
  type        = string
}

variable "tm_routing_method" {
  description = "The traffic routing method for the Traffic Manager profile"
  type        = string
}