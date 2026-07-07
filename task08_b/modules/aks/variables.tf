variable "aks_name" {
  description = "The name of the Azure Kubernetes Service (AKS) cluster."
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

variable "aks_node_pool_name" {
  description = "The name of the node pool for the AKS cluster."
  type        = string
}

variable "aks_node_pool_count" {
  description = "The number of nodes in the node pool for the AKS cluster."
  type        = number
}

variable "aks_node_pool_size" {
  description = "The size of the nodes in the node pool for the AKS cluster."
  type        = string
}

variable "aks_node_pool_disk_type" {
  description = "The disk type for the nodes in the node pool for the AKS cluster."
  type        = string
}

variable "aks_node_pool_os_disk_size_gb" {
  description = "Optional explicit OS disk size in GB. Required when aks_node_pool_disk_type is 'Ephemeral' and the VM size's default disk size (128GB) exceeds its local NVMe capacity."
  type        = number
  default     = null
}

variable "acr_id" {
  description = "The ID of the Azure Container Registry, for the AcrPull role assignment."
  type        = string
}

variable "keyvault_id" {
  description = "The ID of the Key Vault, for the Key Vault access policy granted to the Key Vault Secrets Provider identity."
  type        = string
}
