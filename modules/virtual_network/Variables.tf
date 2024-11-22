# Define a variable for the resource group's name
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  # This variable must be provided when executing the Terraform plan
}

# Define a variable for the Azure location
variable "location" {
  description = "The Azure location where resources will be deployed"
  type        = string
  default     = "East US"
  # Default location is set to East US if not specified
}

# Define a variable for the virtual network's address space
variable "vnet_address_space" {
  description = "The address space of the virtual network"
  type        = string
  default     = "10.0.0.0/16"
  # Default address space for the virtual network
}

# Define a variable for the web tier subnet's CIDR
variable "web_subnet_cidr" {
  description = "The CIDR for the web tier subnet"
  type        = string
  default     = "10.0.1.0/24"
  # Default CIDR for the web tier subnet
}

# Define a variable for the database tier subnet's CIDR
variable "db_subnet_cidr" {
  description = "The CIDR for the database tier subnet"
  type        = string
  default     = "10.0.2.0/24"
  # Default CIDR for the database tier subnet
}

