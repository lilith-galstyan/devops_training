resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
  tags     = var.tags
}

data "azurerm_key_vault" "kv" {
  name                = var.kv_name
  resource_group_name = var.kv_rg_name
}

module "sql" {
  source                    = "./modules/sql"
  resource_group_name       = azurerm_resource_group.rg.name
  location                  = azurerm_resource_group.rg.location
  sql_server_name           = local.sql_server_name
  sql_db_name               = local.sql_db_name
  sql_sku                   = var.sql_sku
  sql_fwr_name              = var.sql_fwr_name
  admin_username            = var.admin_username
  key_vault_id              = data.azurerm_key_vault.kv.id
  sql_admin_secret_name     = var.sql_admin_secret_name
  sql_admin_secret_password = var.sql_admin_secret_password
  allowed_ip_address        = var.allowed_ip_address
  tags                      = var.tags
}

module "webapp" {
  source                = "./modules/webapp"
  resource_group_name   = azurerm_resource_group.rg.name
  location              = azurerm_resource_group.rg.location
  app_name              = local.app_name
  asp_name              = local.asp_name
  asp_sku               = var.asp_sku
  app_dotnet_version    = var.app_dotnet_version
  sql_connection_string = module.sql.sql_connection_string
  tags                  = var.tags
}