variable "unique_id" {
  type        = string
  description = "Unique identifier appended"
}

variable "location" {
  type        = string
  description = "Azure region where Firewall and Public IP will be deployed"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the existing Resource Group"
}

variable "vnet_name" {
  type        = string
  description = "Name of the existing Virtual Network"
}

variable "afw_subnet_address_prefix" {
  type        = string
  description = "Address prefix (CIDR) for the AzureFirewallSubnet"
}

variable "aks_subnet_id" {
  type        = string
  description = "Resource ID of the existing AKS cluster subnet"
}

variable "public_ip_name" {
  type        = string
  description = "Base name for the Azure Firewall Public IP Address resource"
}

variable "firewall_sku_name" {
  type        = string
  description = "Azure Firewall SKU name"
}

variable "firewall_sku_tier" {
  type        = string
  description = "Azure Firewall SKU tier"
}

variable "aks_loadbalancer_ip" {
  type        = string
  description = "Public IP address of the AKS internal"
}

variable "nginx_nat_port" {
  type        = string
  description = "Port used to DNAT inbound traffic"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources created by this module"
}