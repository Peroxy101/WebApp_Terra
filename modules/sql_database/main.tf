resource "azurerm_sql_server" "example" {
  # The name of the SQL Server, specified by a variable.
  name                         = var.sql_server_name
  
  # The name of the resource group in which the SQL Server is deployed.
  resource_group_name          = var.resource_group_name
  
  # The Azure location where the SQL Server is deployed.
  location                     = var.location
  
  # The version of the SQL Server.
  version                      = "12.0"
  
  # The administrator login name for the SQL Server.
  administrator_login          = var.administrator_login
  
  # The administrator login password for the SQL Server.
  administrator_login_password = var.administrator_password
}


resource "azurerm_sql_database" "example" {
  # The name of the SQL Database, specified by a variable.
  name                = var.sql_database_name
  
  # The name of the resource group where the SQL Database is deployed.
  resource_group_name = var.resource_group_name
  
  # The Azure location where the SQL Database is deployed.
  location            = var.location
  
  # The name of the SQL Server hosting this database.
  server_name         = azurerm_sql_server.example.name
  
  # The edition (pricing tier) of the SQL Database.
  edition             = var.pricing_tier
  
  # The desired service objective name for the database.
  requested_service_objective_name = var.database_service_objective_name
  
  # The maximum size of the SQL Database in bytes.
  max_size_bytes      = var.database_size
}


resource "azurerm_sql_firewall_rule" "allow_azure_services" {
  # The name of the firewall rule.
  name                = "AllowAzureServices"
  
  # The resource group where the SQL Server resides.
  resource_group_name = var.resource_group_name
  
  # The name of the SQL Server to which this firewall rule applies.
  server_name         = azurerm_sql_server.example.name
  
  # The starting IP address range for the rule, allowing access from specific addresses.
  start_ip_address    = "0.0.0.0"
  
  # The ending IP address range for the rule.
  end_ip_address      = "0.0.0.0"
}

