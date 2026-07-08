variable "redis_aci_name" {
  description = "The name of the Redis Azure Container Instance."
  type        = string
}

variable "redis_aci_sku" {
  description = "The SKU of the Redis Azure Container Instance."
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

variable "tags" {
  description = "Tags to be applied to the resources."
  type        = map(string)
}

variable "keyvault_id" {
  description = "The ID of the Key Vault to store Redis secrets in."
  type        = string
}

variable "redis_hostname_secret_name" {
  description = "Secret name in Key Vault for the Redis hostname."
  type        = string
}

variable "redis_password_secret_name" {
  description = "Secret name in Key Vault for the Redis password."
  type        = string
}
