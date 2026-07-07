data "azurerm_client_config" "current" {}

resource "azurerm_kubernetes_cluster" "k8s" {
  location            = var.location
  name                = var.aks_name
  resource_group_name = var.resource_group_name
  dns_prefix          = var.aks_name
  tags                = var.tags

  identity {
    type = "SystemAssigned"
  }

  # AKS does not allow disabling OIDC issuer once enabled - some addons
  # (e.g. the Key Vault Secrets Provider) turn it on implicitly, so we
  # declare it explicitly to avoid drift/update errors on later applies.
  oidc_issuer_enabled = true

  default_node_pool {
    name            = var.aks_node_pool_name
    vm_size         = var.aks_node_pool_size
    node_count      = var.aks_node_pool_count
    os_disk_type    = var.aks_node_pool_disk_type
    os_disk_size_gb = var.aks_node_pool_os_disk_size_gb
  }

  key_vault_secrets_provider {
    secret_rotation_enabled = true
  }

  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }
}

# Allow AKS (via its kubelet identity) to pull images from ACR
resource "azurerm_role_assignment" "aks_acr_pull" {
  scope                = var.acr_id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.k8s.kubelet_identity[0].object_id
}

# Allow AKS's Key Vault Secrets Provider (CSI driver) identity to read secrets
resource "azurerm_key_vault_access_policy" "aks_kv_secrets_provider" {
  key_vault_id = var.keyvault_id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_kubernetes_cluster.k8s.key_vault_secrets_provider[0].secret_identity[0].object_id

  secret_permissions = [
    "Get",
    "List",
  ]
}
