variable "aci_name" {
  description = "The name of the Azure Container Instance."
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "location" {
  description = "Region where the resource group is located."
  type        = string
}

variable "aci_sku" {
  description = "The SKU of the Azure Container Instance."
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the resources."
  type        = map(string)
}

variable "cpu_cores" {
  description = "The number of CPU cores for the Azure Container Instance."
  type        = number
  default     = 1
}

variable "memory_in_gb" {
  description = "The amount of memory in GB for the Azure Container Instance."
  type        = number
  default     = 1.5
}

variable "port" {
  description = "The port number for the Azure Container Instance."
  type        = number
  default     = 80
}

variable "image" {
  description = "The Docker image to be used for the Azure Container Instance."
  type        = string
}

variable "restart_policy" {
  description = "Restart policy for the container group."
  type        = string
  default     = "Always"
}

variable "zone" {
  description = "Availability zone for the container group."
  type        = string
  default     = ""
}

variable "acr_login_server" {
  description = "Login server URL of the Azure Container Registry."
  type        = string
}

variable "acr_admin_username" {
  description = "Admin username for the Azure Container Registry."
  type        = string
}

variable "acr_admin_password" {
  description = "Admin password for the Azure Container Registry."
  type        = string
  sensitive   = true
}

variable "redis_hostname" {
  description = "Redis Cache hostname, from Key Vault secret."
  type        = string
  sensitive   = true
}

variable "redis_primary_key" {
  description = "Redis Cache primary access key, from Key Vault secret."
  type        = string
  sensitive   = true
}