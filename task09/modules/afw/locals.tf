locals {
  afw_subnet_name              = "AzureFirewallSubnet"
  afw_name                     = "afw-${var.unique_id}"
  afw_pip_name                 = "${var.public_ip_name}-${var.unique_id}"
  afw_ip_config_name           = "afw-ipconfig-${var.unique_id}"
  route_table_name             = "rt-${var.unique_id}"
  default_route_name           = "rt-default-route-${var.unique_id}"
  app_rule_collection_name     = "arc-aks-egress-${var.unique_id}"
  network_rule_collection_name = "nrc-aks-egress-${var.unique_id}"
  nat_rule_collection_name     = "natrc-nginx-${var.unique_id}"

  aks_fqdn_tags = ["AzureKubernetesService"]

  aks_allowed_fqdns = [
    "*.hcp.${var.location}.azmk8s.io",
    "mcr.microsoft.com",
    "*.data.mcr.microsoft.com",
    "management.azure.com",
    "login.microsoftonline.com",
    "packages.microsoft.com",
    "acs-mirror.azureedge.net",
    "*.blob.core.windows.net",
  ]

  aks_network_rules = {
    dns = {
      destination_ports     = ["53"]
      destination_addresses = ["*"]
      protocols             = ["UDP", "TCP"]
    }
    ntp = {
      destination_ports     = ["123"]
      destination_addresses = ["*"]
      protocols             = ["UDP"]
    }
    tunnel = {
      destination_ports     = ["9000"]
      destination_addresses = ["AzureCloud.${var.location}"]
      protocols             = ["TCP"]
    }
  }
}
