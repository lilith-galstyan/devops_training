output "lb_ip" {
  description = "The public LoadBalancer IP address of the deployed Kubernetes Service."
  value       = data.kubernetes_service.app_service.status[0].load_balancer[0].ingress[0].ip
}
