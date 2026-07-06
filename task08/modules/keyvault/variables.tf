variable "keyvault_name" {
  description = "The name of the Key Vault."
  type        = string
}

variable "keyvault_sku" {
  description = "The SKU of the Key Vault."
  type        = string
  default     = "standard"
}

variable "redis_primary_key" {
  description = "The primary key for the Redis cache."
  type        = string
}

variable "redis_hostname" {
  description = "The hostname of the Redis cache."
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the resources."
  type        = map(string)
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "location" {
  description = "Region where the resource group is located."
  type        = string
}