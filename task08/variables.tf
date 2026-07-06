variable "resources_name_prefix" {
  description = "Prefix used to generate names for all resources (used in locals.tf)."
  type        = string
}

variable "location" {
  description = "Region where the resource group is located."
  type        = string
}

variable "aci_sku" {
  description = "The SKU of the Azure Container Instance."
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the resources."
  type        = map(string)
}

variable "cpu_cores" {
  description = "The number of CPU cores for the Azure Container Instance."
  type        = number
  default     = 1
}

variable "memory_in_gb" {
  description = "The amount of memory in GB for the Azure Container Instance."
  type        = number
  default     = 1.5
}

variable "port" {
  description = "The port number for the Azure Container Instance."
  type        = number
  default     = 80
}

variable "restart_policy" {
  description = "Restart policy for the container group."
  type        = string
  default     = "Always"
}

variable "zone" {
  description = "Availability zone for the container group."
  type        = string
  default     = ""
}


variable "acr_name" {
  description = "The name of the Azure Container Registry."
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


variable "git_pat" {
  description = "GitHub personal access token for accessing private repositories."
  type        = string
  sensitive   = true

}

variable "github_repo_url" {
  description = "The URL of the GitHub repository containing the Dockerfile."
  type        = string
}

variable "aks_name" {
  description = "The name of the Azure Kubernetes Service (AKS) cluster."
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

variable "keyvault_name" {
  description = "The name of the Key Vault."
  type        = string
}

variable "keyvault_sku" {
  description = "The SKU of the Key Vault."
  type        = string
  default     = "standard"
}

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