variable "acr_login_server" {
  description = "Login server URL of the Azure Container Registry."
  type        = string
}

variable "image_name" {
  description = "The name of the Docker image."
  type        = string
}

variable "image_tag" {
  description = "The tag of the Docker image to deploy."
  type        = string
  default     = "latest"
}

variable "aks_kv_access_identity_id" {
  description = "Client ID of the AKS Key Vault Secrets Provider identity."
  type        = string
}

variable "kv_name" {
  description = "The name of the Key Vault."
  type        = string
}

variable "redis_url_secret_name" {
  description = "Secret name in Key Vault for the Redis hostname."
  type        = string
}

variable "redis_password_secret_name" {
  description = "Secret name in Key Vault for the Redis password."
  type        = string
}

variable "tenant_id" {
  description = "Azure AD tenant ID."
  type        = string
}

variable "k8s_manifests_path" {
  description = "Filesystem path to the k8s-manifests directory (passed from root using path.root)."
  type        = string
}
