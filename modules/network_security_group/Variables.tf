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


variable "vnet_address_space" {
  # Description of the variable, explaining the purpose of the address space.
  description = "The address space of the virtual network"
  # Type of the variable, defined as a string.
  type        = string
  # Default address space for the virtual network, set to "10.0.0.0/16".
  default     = "10.0.0.0/16"
}


variable "web_subnet_cidr" {
  # Description of the variable, explaining its purpose for the web tier subnet.
  description = "The CIDR for the web tier subnet"
  # Type of the variable, specified as a string.
  type        = string
  # Default CIDR for the web subnet, set to "10.0.1.0/24".
  default     = "10.0.1.0/24"
}


variable "db_subnet_cidr" {
  # Description of the variable, explaining its purpose for the database tier subnet.
  description = "The CIDR for the database tier subnet"
  # Type of the variable, specified as a string.
  type        = string
  # Default CIDR for the database subnet, set to "10.0.2.0/24".
  default     = "10.0.2.0/24"
}
