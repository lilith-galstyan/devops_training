output "id" {
  description = "The ID of the Key Vault."
  value       = azurerm_key_vault.kv.id
  depends_on  = [time_sleep.wait_for_access_policy]
}

output "name" {
  description = "The name of the Key Vault."
  value       = azurerm_key_vault.kv.name
  depends_on  = [time_sleep.wait_for_access_policy]
}
