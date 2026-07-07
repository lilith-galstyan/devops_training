data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  name                = var.keyvault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = var.keyvault_sku
  tags                = var.tags
}

resource "azurerm_key_vault_access_policy" "current_user" {
  key_vault_id = azurerm_key_vault.kv.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  secret_permissions = [
    "Get", "List", "Set", "Delete", "Purge", "Recover", "Backup", "Restore"
  ]
}

# Azure AD permission propagation can lag behind the ARM resource being
# marked complete - this buffer avoids 403s on the very next operation
# (e.g. aci_redis module writing secrets), regardless of whether the
# access policy was just created OR updated.
resource "time_sleep" "wait_for_access_policy" {
  depends_on      = [azurerm_key_vault_access_policy.current_user]
  create_duration = "60s"
}
