variable "name" {
  description = "The name of the App Service Plan."
  type        = string
}

variable "worker_count" {
  description = "The number of workers to be allocated to the App Service Plan."
  type        = number
  default     = 1
}

variable "sku" {
  description = "The SKU of the App Service Plan."
  type        = string
}


variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "resource_group_location" {
  description = "The location of the resource group"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the resource group"
  type        = map(string)
  default     = {}
}

variable "os_type" {
  description = "The O/S type for the App Service Plan."
  type        = string
  default     = "Windows"
}