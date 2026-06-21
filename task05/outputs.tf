output "traffic_manager_fqdn" {
  description = "The FQDN of the Azure Traffic Manager profile"
  value       = module.traffic_manager.fqdn
}