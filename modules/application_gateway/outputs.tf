output "application_gateway_id" {
  description = "The ID of the Application Gateway"
  value       = azurerm_application_gateway.app_gateway.id
}

output "public_ip_address" {
  description = "The Public IP Address for the Application Gateway"
  value       = azurerm_public_ip.app_gateway_public_ip.ip_address
}

output "frontend_ip_address" {
  description = "The Frontend IP Address for the Application Gateway"
  value       = azurerm_application_gateway.app_gateway.frontend_ip_configuration[0].private_ip_address
}
