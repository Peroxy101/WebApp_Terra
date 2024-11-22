output "public_ip_address" {
  description = "The public IP address of the load balancer."
  value       = azurerm_public_ip.lb.ip_address
}

output "load_balancer_id" {
  description = "The ID of the load balancer."
  value       = azurerm_lb.main.id
}

output "frontend_ip_configuration" {
  description = "The frontend IP configuration of the load balancer."
  value       = azurerm_lb_frontend_ip_configuration.config.name
}

output "backend_address_pool_id" {
  description = "The ID of the backend address pool."
  value       = azurerm_lb_backend_address_pool.bap.id
}

output "http_probe_id" {
  description = "The ID of the HTTP probe."
  value       = azurerm_lb_probe.http.id
}

output "http_rule_id" {
  description = "The ID of the HTTP load balancer rule."
  value       = azurerm_lb_rule.http.id
}

output "network_interface_backend_associations" {
  description = "List of network interface backend address pool associations."
  value       = [for id in azurerm_network_interface_backend_address_pool_association.vm_pool_association : id.id]
}

