variable "resources_name_prefix" {
  description = "Prefix used to generate names for all resources (used in locals.tf)."
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

variable "keyvault_sku" {
  description = "The SKU of the Key Vault."
  type        = string
  default     = "standard"
}

variable "redis_hostname_secret_name" {
  description = "Secret name in Key Vault for the Redis hostname."
  type        = string
}

variable "redis_password_secret_name" {
  description = "Secret name in Key Vault for the Redis password."
  type        = string
}

variable "redis_aci_sku" {
  description = "The SKU of the Redis Azure Container Instance."
  type        = string
}

variable "sa_replication_type" {
  description = "The replication type of the Storage Account."
  type        = string
}

variable "sa_container_name" {
  description = "The name of the Blob Container in the Storage Account."
  type        = string
}


variable "acr_sku" {
  description = "The SKU of the Azure Container Registry."
  type        = string
}

variable "image_name" {
  description = "The name of the Docker image to be pushed to the Azure Container Registry."
  type        = string
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
  description = "Optional explicit OS disk size in GB (needed if aks_node_pool_disk_type is 'Ephemeral' and the VM size's default 128GB disk exceeds its local NVMe capacity)."
  type        = number
  default     = null
}

variable "aca_env_workload_profile_type" {
  description = "Workload profile type for the Azure Container App Environment."
  type        = string
}

variable "aca_workload_profile_type" {
  description = "Workload profile type for the Azure Container App."
  type        = string
}