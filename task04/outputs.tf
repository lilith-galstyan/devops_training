output "vm_public_ip" {
  description = "VM public IP"
  value       = azurerm_public_ip.pip.ip_address
}

output "vm_fqdn" {
  description = "Fully Qualified Domain Name of the Virtual Machine"
  value       = azurerm_public_ip.pip.fqdn
}