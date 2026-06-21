variable "name" {
  description = "The name of the Traffic Manager profile"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the Traffic Manager profile will be deployed"
  type        = string
}

variable "traffic_routing_method" {
  description = "The traffic routing method for the Traffic Manager profile"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the Traffic Manager profile"
  type        = map(string)
  default     = {}
}

variable "endpoints" {
  description = "Map of Azure endpoints to attach to the Traffic Manager profile, keyed by endpoint name"
  type = map(object({
    target_resource_id = string
  }))
}

variable "monitor_protocol" {
  description = "The protocol used by Traffic Manager to monitor endpoint health"
  type        = string
  default     = "HTTPS"
}

variable "monitor_port" {
  description = "The port used by Traffic Manager to monitor endpoint health"
  type        = number
  default     = 443
}

variable "monitor_path" {
  description = "The path used by Traffic Manager to monitor endpoint health"
  type        = string
  default     = "/"
}

variable "dns_ttl" {
  description = "The TTL value for the Traffic Manager DNS configuration"
  type        = number
  default     = 30
}