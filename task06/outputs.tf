output "app_hostname" {
  description = "The hostname of the Azure Linux Web App"
  value       = module.webapp.app_hostname
}

output "sql_server_fqdn" {
  description = "The FQDN of the Azure SQL Server"
  value       = module.sql.sql_server_fqdn
}