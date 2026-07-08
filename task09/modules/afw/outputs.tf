output "firewall_id" {
  description = "Resource ID of the Azure Firewall"
  value       = azurerm_firewall.this.id
}

output "firewall_name" {
  description = "Name of the Azure Firewall"
  value       = azurerm_firewall.this.name
}

output "firewall_public_ip" {
  description = "Public IP address of the Azure Firewall"
  value       = azurerm_public_ip.afw.ip_address
}

output "firewall_private_ip" {
  description = "Private IP address of the Azure Firewall"
  value       = azurerm_firewall.this.ip_configuration[0].private_ip_address
}

output "afw_subnet_id" {
  description = "Resource ID of the AzureFirewallSubnet"
  value       = azurerm_subnet.afw.id
}

output "route_table_id" {
  description = "Resource ID of the Route Table pointing to the Azure Firewall"
  value       = azurerm_route_table.afw.id
}
