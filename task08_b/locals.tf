locals {
  rg_name        = "${var.resources_name_prefix}-rg"
  acr_name       = lower(replace("${var.resources_name_prefix}cr", "-", ""))
  aks_name       = "${var.resources_name_prefix}-aks"
  keyvault_name  = "${var.resources_name_prefix}-kv"
  redis_aci_name = "${var.resources_name_prefix}-redis-ci"
  sa_name        = lower(replace("${var.resources_name_prefix}sa", "-", ""))
  aca_name       = "${var.resources_name_prefix}-ca"
  aca_env_name   = "${var.resources_name_prefix}-cae"
}