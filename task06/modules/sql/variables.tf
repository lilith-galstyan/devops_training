variable "sql_admin_secret_name" {
  description = "Key Vault Secret name for SQL admin name"
  type        = string
}

variable "sql_server_name" {
  description = "SQL Server name"
  type        = string
}

variable "sql_db_name" {
    description = "SQL Database name"
    type        = string
}

variable "sql_sku" {
  description = "SQL Database service model"
  type        = string
}

variable "sql_fwr_name" {
  description = "SQL Server Firewall Rule name"
  type = string
}

variable "tags" {
  description = "Tags to apply to the Web App"
  type        = map(string)
  default     = {}
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "admin_username" {
  description = "SQL administrator username"
  type        = string
}


variable "key_vault_id" {
  description = "ID of the existing Key Vault to store secrets"
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

variable "sql_server_version" {
  description = "SQL Server version"
  type        = string
  default     = "12.0"
}

variable "allow_azure_services_rule_name" {
  description = "Firewall rule name for allowing Azure services"
  type        = string
  default     = "allow-azure-services"
}