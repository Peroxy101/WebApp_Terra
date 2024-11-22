output "sql_server_id" {
  # Outputs the resource ID of the SQL Server.
  value       = azurerm_sql_server.example.id
  description = "The ID of the Azure SQL Server."
}

output "sql_database_id" {
  # Outputs the resource ID of the SQL Database.
  value       = azurerm_sql_database.example.id
  description = "The ID of the Azure SQL Database."
}

output "sql_firewall_rule_id" {
  # Outputs the resource ID of the SQL Firewall Rule.
  value       = azurerm_sql_firewall_rule.allow_azure_services.id
  description = "The ID of the Azure SQL Firewall Rule."
}
