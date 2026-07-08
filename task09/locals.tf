locals {
  afw_subnet_address_prefix = cidrsubnet(var.vnet_space, 10, 4)

  fw_to_lb_nsg_rule_name = "AllowAccessFromFirewallPublicIPToLoadBalancerIP"

  common_tags = merge(
    {
      environment = "task09"
      managed_by  = "terraform"
      unique_id   = var.unique_id
    },
    var.tags
  )
}