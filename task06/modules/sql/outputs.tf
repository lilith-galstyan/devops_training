output "sql_server_name" {
  description = "The name of the Azure SQL Server"
  value       = azurerm_mssql_server.server.name
}

output "admin_password" {
  description = "The generated SQL admin password"
  sensitive   = true
  value       = local.admin_password
}

output "sql_server_fqdn" {
  description = "The FQDN of the Azure SQL Server"
  value       = azurerm_mssql_server.server.fully_qualified_domain_name
}

output "sql_connection_string" {
  description = "The connection string for the Azure SQL Database"
  sensitive   = true
  value       = "Server=tcp:${azurerm_mssql_server.server.fully_qualified_domain_name},1433;Initial Catalog=${azurerm_mssql_database.db.name};Persist Security Info=False;User ID=${var.admin_username};Password=${local.admin_password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
}