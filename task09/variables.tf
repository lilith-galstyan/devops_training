variable "unique_id" {
  type        = string
  description = "Unique identifier used as a naming standard for all resources created"
}

variable "location" {
  type        = string
  description = "Azure region for Azure Firewall and Public IP resources"
}

variable "rg_name" {
  type        = string
  description = "Name of the existing Resource Group"
}

variable "vnet_name" {
  type        = string
  description = "Name of the existing Virtual Network"
}

variable "vnet_space" {
  type        = string
  description = "Address space of the existing Virtual Network"
}

variable "subnet_name" {
  type        = string
  description = "Name of the existing AKS cluster subnet"
}

variable "subnet_space" {
  type        = string
  description = "Address space of the existing AKS cluster subnet"
}

variable "aks_cluster_name" {
  type        = string
  description = "Name of the existing AKS cluster"
}

variable "public_ip_name" {
  type        = string
  description = "Base name for the Azure Firewall Public IP Address resource"
}

variable "afw_subnet_address_prefix" {
  type        = string
  description = "Address prefix (CIDR) for the AzureFirewallSubnet"
}

variable "aks_loadbalancer_ip" {
  type        = string
  description = "Public IP address of the AKS load balancer fronting the NGINX service"
}

variable "tags" {
  type        = map(string)
  description = "Tags to be applied to all resources"
}