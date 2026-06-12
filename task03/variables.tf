variable "resource_group_name" {
  type        = string
  description = "Name of the resource group."
}

variable "storage_account_name" {
  type        = string
  description = "Name of the storage account."
}

variable "vnet_name" {
  type        = string
  description = "Name of the virtual network."
}

variable "creator_tag" {
  type        = string
  description = "Name of the creator tag."
}

variable "subnet_frontend_name" {
  type        = string
  description = "Name of the frontend subnet"
}

variable "subnet_backend_name" {
  type        = string
  description = "Name of the backend subnet"
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space CIDR block assigned to the Virtual Network"
  type        = list(string)
}

variable "subnet_backend_prefixes" {
  description = "Address prefix CIDR block for the backend subnet"
  type        = list(string)
}

variable "subnet_frontend_prefixes" {
  description = "Address prefix CIDR block for the frontend subnet"
  type        = list(string)
}
