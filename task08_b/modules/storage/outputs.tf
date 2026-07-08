output "storage_account_name" {
  description = "The name of the Storage Account."
  value       = azurerm_storage_account.sa.name
}

output "blob_url" {
  description = "The URL of the uploaded application archive blob."
  value       = azurerm_storage_blob.app_archive_blob.url
}

output "sas_token" {
  description = "SAS token (query string) for the Blob Container."
  value       = data.azurerm_storage_account_blob_container_sas.sas.sas
  sensitive   = true
}
