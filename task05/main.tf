#resource_groups
module "rg1" {
  source   = "./modules/resource_group"
  name     = var.resource_groups["rg1"].name
  location = var.resource_groups["rg1"].location
  tags     = var.tags
}

module "rg2" {
  source   = "./modules/resource_group"
  name     = var.resource_groups["rg2"].name
  location = var.resource_groups["rg2"].location
  tags     = var.tags
}

module "rg3" {
  source   = "./modules/resource_group"
  name     = var.resource_groups["rg3"].name
  location = var.resource_groups["rg3"].location
  tags     = var.tags
}

#app_service_plans
module "asp1" {
  source                  = "./modules/app_service_plan"
  name                    = var.app_service_plans["asp1"].name
  worker_count            = var.app_service_plans["asp1"].worker_count
  sku                     = var.app_service_plans["asp1"].sku
  resource_group_name     = module.rg1.name
  resource_group_location = module.rg1.location
  tags                    = var.tags
}

module "asp2" {
  source                  = "./modules/app_service_plan"
  name                    = var.app_service_plans["asp2"].name
  worker_count            = var.app_service_plans["asp2"].worker_count
  sku                     = var.app_service_plans["asp2"].sku
  resource_group_name     = module.rg2.name
  resource_group_location = module.rg2.location
  tags                    = var.tags
}


#app services

locals {
  ip_restrictions = [
    {
      name       = var.allow_ip_rule_name
      priority   = 100
      action     = "Allow"
      ip_address = "${var.verification_agent_ip}/32"
    },
    {
      name        = var.allow_tm_rule_name
      priority    = 200
      action      = "Allow"
      service_tag = var.tm_service_tag
    },
  ]
}

module "app1" {
  source                  = "./modules/app_service"
  name                    = var.app_services["app1"].name
  resource_group_name     = module.rg1.name
  resource_group_location = module.rg1.location
  service_plan_id         = module.asp1.id
  ip_restrictions         = local.ip_restrictions
  tags                    = var.tags
}

module "app2" {
  source                  = "./modules/app_service"
  name                    = var.app_services["app2"].name
  resource_group_name     = module.rg2.name
  resource_group_location = module.rg2.location
  service_plan_id         = module.asp2.id
  ip_restrictions         = local.ip_restrictions
  tags                    = var.tags
}

#traffic_manager
module "traffic_manager" {
  source                 = "./modules/traffic_manager"
  name                   = var.traffic_manager_name
  resource_group_name    = module.rg3.name
  traffic_routing_method = var.tm_routing_method
  tags                   = var.tags

  endpoints = {
    app1 = { target_resource_id = module.app1.id }
    app2 = { target_resource_id = module.app2.id }
  }
}