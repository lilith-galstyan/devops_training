locals {
  afw_subnet_address_prefix = coalesce(var.afw_subnet_address_prefix, cidrsubnet(var.vnet_space, 10, 4))

  common_tags = merge(
    {
      environment = "task09"
      managed_by  = "terraform"
      unique_id   = var.unique_id
    },
    var.tags
  )
}
