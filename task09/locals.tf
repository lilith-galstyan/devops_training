locals {
  afw_subnet_name               = "AzureFirewallSubnet"
  afw_name                      = "${var.unique_id}-afw"
  afw_pip_name                  = var.public_ip_name
  afw_ip_config_name            = "${var.unique_id}-afw-ipconfig"
  route_table_name              = "${var.unique_id}-rt"
  default_route_name            = "${var.unique_id}-rt-default-route"
  app_rule_collection_name      = "${var.unique_id}-arc"
  network_rule_collection_name  = "${var.unique_id}-nrc"
  nat_rule_collection_name      = "${var.unique_id}-natrc"

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
      protocols              = ["UDP", "TCP"]
    }
    ntp = {
      destination_ports     = ["123"]
      destination_addresses = ["*"]
      protocols              = ["UDP"]
    }
    tunnel = {
      destination_ports     = ["9000"]
      destination_addresses = ["AzureCloud.${var.location}"]
      protocols              = ["TCP"]
    }
  }
}