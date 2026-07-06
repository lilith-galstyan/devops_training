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

variable "tags" {
  description = "Tags to be applied to the resources."
  type        = map(string)
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "location" {
  description = "Region where the resource group is located."
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