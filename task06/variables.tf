variable "location" {
  description = "Azure region"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the resources"
  type        = map(string)
  default     = {}
}

variable "kv_name" {
  description = "Key Vault name"
  type        = string
}

variable "kv_rg_name" {
  description = "Key Vault resource group name"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "admin_username" {
  description = "SQL administrator username"
  type        = string
}

variable "sql_sku" {
  description = "SQL Database service model"
  type        = string
}

variable "sql_fwr_name" {
  description = "SQL Server Firewall Rule name"
  type        = string
}

variable "sql_admin_secret_name" {
  description = "Key Vault Secret name for SQL admin username"
  type        = string
}

variable "sql_admin_secret_password" {
  description = "Key Vault Secret name for SQL admin password"
  type        = string
}

variable "allowed_ip_address" {
  description = "IP address allowed through SQL Server firewall"
  type        = string
}

variable "asp_sku" {
  description = "App Service Plan SKU"
  type        = string
}

variable "app_dotnet_version" {
  description = "Web Application dotnet version"
  type        = string
}