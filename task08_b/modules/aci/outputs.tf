output "aci_fqdn" {
  value       = azurerm_container_group.container.fqdn
  description = "The fully qualified domain name (FQDN) of the Azure Container Instance (ACI)."
}