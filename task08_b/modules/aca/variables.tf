variable "aca_name" {
  description = "The name of the Azure Container App."
  type        = string
}

variable "aca_env_name" {
  description = "The name of the Azure Container App Environment."
  type        = string
}

variable "aca_workload_profile_type" {
  description = "Workload profile type for the Azure Container App."
  type        = string
}

variable "aca_env_workload_profile_type" {
  description = "Workload profile type for the Azure Container App Environment."
  type        = string
}

variable "location" {
  description = "Region where the resource group is located."
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the resources."
  type        = map(string)
}

variable "keyvault_id" {
  description = "The ID of the Key Vault to grant ACA's managed identity access to."
  type        = string
}

variable "acr_id" {
  description = "The ID of the Azure Container Registry, for the AcrPull role assignment."
  type        = string
}

variable "acr_login_server" {
  description = "Login server URL of the Azure Container Registry."
  type        = string
}

variable "image_name" {
  description = "The name of the Docker image."
  type        = string
}

variable "image_tag" {
  description = "The tag of the Docker image to deploy."
  type        = string
  default     = "latest"
}

variable "redis_hostname_secret_id" {
  description = "Key Vault Secret ID (versioned) for the Redis hostname."
  type        = string
}

variable "redis_password_secret_id" {
  description = "Key Vault Secret ID (versioned) for the Redis password."
  type        = string
}
