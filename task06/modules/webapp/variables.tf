variable "asp_name" {
    description = "App Service Plan name"
    type        = string
}

variable "asp_sku" {
    description = "App Service Plan SKU"
    type        = string
}

variable "app_name" {
    description = "Web App name"
    type        = string
}

variable "app_dotnet_version" {
    description = "Web App .NET version"
    type        = string
}

variable "tags" {
    description = "Tags to apply to the Web App"
    type        = map(string)
    default     = {}
}

variable "location" {
    description = "Azure region"
    type        = string
}

variable "resource_group_name" {
    description = "Resource group name"
    type        = string
}

variable "sql_connection_string" {
  description = "SQL Database connection string passed from sql module"
  type        = string
  sensitive   = true
}