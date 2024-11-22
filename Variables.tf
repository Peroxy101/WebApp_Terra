// variables.tf

variable "name" {
  description = "The name of the Application Gateway"
  type        = string
  default     = "app-gateway"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "capacity" {
  description = "The capacity of the Application Gateway"
  type        = number
  default     = 2
}

variable "subnet_id" {
  description = "The ID of the subnet to associate with the Application Gateway"
  type        = string
}

variable "frontend_port" {
  description = "The frontend port number for the Application Gateway"
  type        = number
  default     = 80
}

variable "backend_port" {
  description = "The backend port number for the Application Gateway"
  type        = number
  default     = 80
}

variable "request_timeout" {
  description = "The request timeout for the Application Gateway"
  type        = number
  default     = 30
}


variable "public_ip_name" {
  description = "Name of the public IP address"
  type        = string
}

variable "public_ip_name-app-gateway" {
  description = "The name of the public IP associated with the Application Gateway"
  type        = string
  default     = "app-gateway-public-ip"
}

// Variables for the Azure Recovery Services module.

variable "vault_name" {
  description = "The name of the Recovery Services Vault."
  type        = string
}

variable "sku_name" {
  description = "The SKU name for the Recovery Services Vault."
  type        = string
}

variable "policy_name" {
  description = "The name of the backup policy."
  type        = string
}

variable "backup_frequency" {
  description = "The frequency of the backup (e.g., Daily, Weekly)."
  type        = string
}

variable "backup_time" {
  description = "The time of day to perform the backup."
  type        = string
}

variable "retention_daily_count" {
  description = "The number of daily backups to retain."
  type        = number
}

variable "source_vm_ids" {
  description = "The list of VM IDs to protect with the backup policy."
  type        = list(string)
}

variable "key_vault_name" {
  description = "The name of the Azure Key Vault."
  type        = string
}

variable "location" {
  description = "The location where the Key Vault will be created."
  type        = string
}

variable "sql_server_password" {
  description = "The password for the SQL server."
  type        = string
}

variable "ip_rules" {
  description = "List of IP addresses that should be allowed access to the Key Vault."
  type        = list(string)
}

variable "web_nsg_name" {
  description = "The name of the web network security group."
  type        = string
  default     = "web-nsg"
}

variable "db_nsg_name" {
  description = "The name of the database network security group."
  type        = string
  default     = "db-nsg"
}

variable "web_subnet_address_prefix" {
  description = "The address prefix of the web subnet."
  type        = string
}

variable "web_subnet_id" {
  description = "The ID of the web subnet."
  type        = string
}

variable "db_subnet_id" {
  description = "The ID of the database subnet."
  type        = string
}

// variables.tf

variable "tier" {
  description = "The pricing tier to use for the subscription pricing. Possible values are Free and Standard."
  type        = string
  default     = "Standard"
}

variable "resource_type" {
  description = "The type of resource to apply the subscription pricing to."
  type        = string
  default     = "VirtualMachines"
}

variable "email" {
  description = "The email address to send security alerts to."
  type        = string
}

variable "phone" {
  description = "The phone number to send security alerts to."
  type        = string
}

variable "alert_notifications" {
  description = "Enable or disable alert notifications."
  type        = bool
  default     = true
}

variable "alerts_to_admins" {
  description = "Enable or disable alerts to admins."
  type        = bool
  default     = true
}

// variables.tf

variable "admin_username" {
  description = "The admin username for the VMs."
  type        = string
}

variable "admin_password" {
  description = "The admin password for the VMs."
  type        = string
  sensitive   = true
}

variable "web_vm_size" {
  description = "The size of the web VMs."
  type        = string
  default     = "Standard_D2s_v3"
}

variable "db_vm_size" {
  description = "The size of the DB VM."
  type        = string
  default     = "Standard_D4s_v3"
}

variable "web_vm_count" {
  description = "The number of web VMs to deploy."
  type        = number
  default     = 2
}

// variables.tf

variable "vnet_address_space" {
  description = "The address space for the virtual network."
  type        = string
}

variable "web_subnet_cidr" {
  description = "The CIDR block for the web subnet."
  type        = string
}

variable "db_subnet_cidr" {
  description = "The CIDR block for the database subnet."
  type        = string
}

variable "frontend_ip_name" {
  description = "Name of the frontend IP configuration"
  type        = string
}

variable "backend_pool_name" {
  description = "Name of the backend address pool"
  type        = string
}

variable "probe_name" {
  description = "Name of the health probe"
  type        = string
}

variable "lb_rule_name" {
  description = "Name of the load balancing rule"
  type        = string
}

variable "vm_ids" {
  description = "List of VM IDs to include in the backend pool"
  type        = list(string)
}

variable "public_ip_sku" {
  description = "The SKU of the public IP address"
  type        = string
}

variable "public_ip_allocation_method" {
  description = "The allocation method for the public IP address"
  type        = string
}

variable "sql_server_name" {
  description = "The name of the SQL Server."
  type        = string
}

variable "administrator_login" {
  description = "The administrator login name for the SQL Server."
  type        = string
}

variable "administrator_password" {
  description = "The administrator password for the SQL Server."
  type        = string
}

variable "sql_database_name" {
  description = "The name of the SQL Database."
  type        = string
}

variable "pricing_tier" {
  description = "The pricing tier for the SQL Database (e.g., Basic, Standard, Premium)."
  type        = string
}

variable "database_service_objective_name" {
  description = "The service objective name for the SQL Database (e.g., S0, S1, P1)."
  type        = string
}

variable "database_size" {
  description = "The maximum size of the SQL Database in bytes."
  type        = number
}

variable "connection_strings" {
  description = "List of connection strings to be stored in Key Vault"
  type        = list(string) # or `string` if it's a single value
}

