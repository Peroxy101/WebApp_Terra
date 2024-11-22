variable "resource_group_name" {
  # Description of the variable, explaining its purpose.
  description = "The name of the resource group"
  # Specifies the type of the variable, which is a string.
  type        = string
}


variable "location" {
  # Description of the variable, detailing where resources will be deployed.
  description = "The Azure location where resources will be deployed"
  # Type of the variable, specified as a string.
  type        = string
  # Default Azure location if not provided explicitly.
  default     = "East US"
}


variable "key_vault_name" {
  # Description of the variable, explaining its purpose.
  description = "The name of the Key Vault."
  # Type of the variable, which is a string.
  type        = string
}


variable "connection_strings" {
  # Description of the variable, explaining its purpose.
  description = "A map of database connection strings to store as secrets."
  # Type of the variable, defined as a map of strings.
  type        = map(string)
}


variable "sql_server_password" {
  # Description of the variable, explaining its purpose.
  description = "The name of the Key Vault."
  # Type of the variable, which is a string.
  type        = string
}
