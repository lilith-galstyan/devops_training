output "id" {
  description = "The ID of the AKS cluster."
  value       = azurerm_kubernetes_cluster.k8s.id
}

output "name" {
  description = "The name of the AKS cluster."
  value       = azurerm_kubernetes_cluster.k8s.name
}

output "kubelet_identity_object_id" {
  description = "Object ID of the AKS kubelet identity."
  value       = azurerm_kubernetes_cluster.k8s.kubelet_identity[0].object_id
}

output "key_vault_secrets_provider_object_id" {
  description = "Object ID of the AKS Key Vault Secrets Provider identity."
  value       = azurerm_kubernetes_cluster.k8s.key_vault_secrets_provider[0].secret_identity[0].object_id
}

output "key_vault_secrets_provider_client_id" {
  description = "Client ID of the AKS Key Vault Secrets Provider identity (used as userAssignedIdentityID in SecretProviderClass)."
  value       = azurerm_kubernetes_cluster.k8s.key_vault_secrets_provider[0].secret_identity[0].client_id
}

output "host" {
  description = "The Kubernetes cluster server host."
  value       = azurerm_kubernetes_cluster.k8s.kube_config[0].host
  sensitive   = true
}

output "client_certificate" {
  description = "Client certificate for authenticating to the cluster (base64-encoded)."
  value       = azurerm_kubernetes_cluster.k8s.kube_config[0].client_certificate
  sensitive   = true
}

output "client_key" {
  description = "Client key for authenticating to the cluster (base64-encoded)."
  value       = azurerm_kubernetes_cluster.k8s.kube_config[0].client_key
  sensitive   = true
}

output "cluster_ca_certificate" {
  description = "Cluster CA certificate (base64-encoded)."
  value       = azurerm_kubernetes_cluster.k8s.kube_config[0].cluster_ca_certificate
  sensitive   = true
}
