// variables.tf

variable "resource_group_name" {
  # Description of the variable, explaining its purpose.
  description = "Name of the resource group"
  # Specifies the type of the variable, which is a string.
  type        = string
}


variable "location" {
  # Description of the variable, detailing where resources will be deployed.
  description = "Azure region for the resources"
  # Type of the variable, specified as a string.
  type        = string
  # Default Azure location if not provided explicitly.
  default     = "East US"
}


variable "sql_server_name" {
  # Description of the variable, explaining its purpose.
  description = "Name of the SQL Server"
  # Type of the variable, specified as a string.
  type        = string
  # Default name for the SQL Server if not provided explicitly.
  default     = "my-sql-server"
}


variable "sql_database_name" {
  # Description of the variable, explaining its purpose.
  description = "Name of the SQL Database"
  # Type of the variable, specified as a string.
  type        = string
  # Default name for the SQL Database if not provided explicitly.
  default     = "my-database"
}


variable "administrator_login" {
  # Description of the variable, explaining its purpose.
  description = "SQL Administrator login"
  # Type of the variable, specified as a string.
  type        = string
  # Default login name for the SQL Administrator if not provided explicitly.
  default     = "adminuser"
}


variable "administrator_password" {
  # Description of the variable, explaining its purpose.
  description = "SQL Administrator password"
  # Type of the variable, specified as a string.
  type        = string
  # Marks the variable as sensitive, hiding its value in logs and outputs.
  sensitive   = true
}


variable "pricing_tier" {
  # Description of the variable, explaining its purpose.
  description = "Pricing tier for the SQL Database"
  # Type of the variable, specified as a string.
  type        = string
  # Default pricing tier for the SQL Database if not provided explicitly.
  default     = "Standard"
}


variable "database_size" {
  # Description of the variable, explaining its purpose.
  description = "The maximum size of the database"
  # Type of the variable, specified as a string.
  type        = string
  # Default maximum size for the SQL Database if not provided explicitly.
  default     = "10GB"
}


variable "compute_gen" {
  # Description of the variable, explaining its purpose.
  description = "The edition of the database."
  # Type of the variable, specified as a string.
  type        = string
  # Default edition for the database if not provided explicitly.
  default     = "Gen5"
}

variable "database_service_objective_name" {
  # Description of the variable, explaining its purpose.
  description = "The service level objective for the SQL Database"
  # Type of the variable, specified as a string.
  type        = string
  # Default service level objective for the SQL Database if not provided explicitly.
  default     = "S0"
}


