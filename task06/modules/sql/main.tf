resource "random_password" "admin_password" {
  length      = 20
  special     = true
  min_numeric = 1
  min_upper   = 1
  min_lower   = 1
  min_special = 1
}

locals {
  admin_password = random_password.admin_password.result
}

resource "azurerm_mssql_server" "server" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  administrator_login          = var.admin_username
  administrator_login_password = local.admin_password
  version                      = var.sql_server_version
  tags                         = var.tags
}

resource "azurerm_mssql_database" "db" {
  name      = var.sql_db_name
  server_id = azurerm_mssql_server.server.id
  sku_name  = var.sql_sku
  tags      = var.tags
}

resource "azurerm_mssql_firewall_rule" "allow_azure" {
  name             = var.allow_azure_services_rule_name
  server_id        = azurerm_mssql_server.server.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

resource "azurerm_mssql_firewall_rule" "allow_ip" {
  name             = var.sql_fwr_name
  server_id        = azurerm_mssql_server.server.id
  start_ip_address = var.allowed_ip_address
  end_ip_address   = var.allowed_ip_address
}

resource "azurerm_key_vault_secret" "sql_admin_name" {
  name         = var.sql_admin_secret_name
  value        = var.admin_username
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "sql_admin_password" {
  name         = var.sql_admin_secret_password
  value        = local.admin_password
  key_vault_id = var.key_vault_id
}