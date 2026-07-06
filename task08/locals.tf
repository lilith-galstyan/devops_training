locals {
  rg_name       = "${var.resources_name_prefix}-rg"
  aci_name      = "${var.resources_name_prefix}-ci"
  acr_name      = replace("${var.resources_name_prefix}cr", "-", "")
  aks_name      = "${var.resources_name_prefix}-aks"
  keyvault_name = "${var.resources_name_prefix}-kv"
  redis_name    = "${var.resources_name_prefix}-redis"
}