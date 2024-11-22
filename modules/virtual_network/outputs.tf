output "virtual_network_id" {
  # Outputs the resource ID of the Virtual Network.
  value       = azurerm_virtual_network.vnet.id
  description = "The ID of the Azure Virtual Network."
}

output "web_subnet_id" {
  # Outputs the resource ID of the Web Subnet.
  value       = azurerm_subnet.web_subnet.id
  description = "The ID of the Azure Web Subnet."
}

output "db_subnet_id" {
  # Outputs the resource ID of the Database Subnet.
  value       = azurerm_subnet.db_subnet.id
  description = "The ID of the Azure Database Subnet."
}
