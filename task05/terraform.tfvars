resource_groups = {
  rg1 = {
    name     = "cmaz-iaco50xm-mod5-rg-01"
    location = "West Europe"
  },
  rg2 = {
    name     = "cmaz-iaco50xm-mod5-rg-02"
    location = "North Europe"
  },
  rg3 = {
    name     = "cmaz-iaco50xm-mod5-rg-03"
    location = "East US"
  }
}

app_service_plans = {
  asp1 = {
    name         = "cmaz-iaco50xm-mod5-asp-01"
    worker_count = 2
    sku          = "S1"
  },
  asp2 = {
    name         = "cmaz-iaco50xm-mod5-asp-02"
    worker_count = 1
    sku          = "S1"
  },
}

app_services = {
  app1 = {
    name = "cmaz-iaco50xm-mod5-app-01"
  },
  app2 = {
    name = "cmaz-iaco50xm-mod5-app-02"
  },
}

allow_ip_rule_name    = "allow-ip"
allow_tm_rule_name    = "allow-tm"
verification_agent_ip = "18.153.146.156"

tags = {
  Creator = "lilit_galstyan@epam.com"
}

traffic_manager_name = "cmaz-iaco50xm-mod5-traf"
tm_routing_method    = "Performance"