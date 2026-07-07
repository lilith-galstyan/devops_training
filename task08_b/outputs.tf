output "aci_fqdn" {
  value       = module.aci.aci_fqdn
  description = "The fully qualified domain name (FQDN) of the Azure Container Instance (ACI)."
}

output "aks_lb_ip" {
  value       = data.kubernetes_service.app_service.status[0].load_balancer[0].ingress[0].ip
  description = "The public IP address of the AKS Load Balancer."
}