variable "redis_name" {
  description = "The name of the Redis cache."
  type        = string
}

variable "redis_capacity" {
  description = "The capacity of the Redis cache."
  type        = number
}

variable "redis_sku" {
  description = "The SKU of the Redis cache."
  type        = string
}

variable "redis_sku_family" {
  description = "The SKU family of the Redis cache."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the Redis cache."
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

variable "keyvault_id" {
  description = "The ID of the Key Vault to store Redis secrets in."
  type        = string
}

variable "redis_hostname_secret_name" {
  description = "Secret name for the Redis hostname, from task parameter"
  type        = string
}

variable "redis_primary_key_secret_name" {
  description = "Secret name for the Redis primary access key, from task parameter"
  type        = string
}