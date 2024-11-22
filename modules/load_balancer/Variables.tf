variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure location where resources will be created"
  type        = string
  default     = "East US"
}

variable "frontend_ip_name" {
  description = "Name of the frontend IP configuration"
  type        = string
  default     = "frontend-ip-config"
}

variable "backend_pool_name" {
  description = "Name of the backend address pool"
  type        = string
  default     = "backend-pool"
}

variable "probe_name" {
  description = "Name of the health probe"
  type        = string
  default     = "http-health-probe"
}

variable "lb_rule_name" {
  description = "Name of the load balancing rule"
  type        = string
  default     = "http-rule"
}

variable "vm_ids" {
  description = "List of VM IDs to include in the backend pool"
  type        = list(string)
}

variable "public_ip_name" {
  description = "Name of the public IP address"
  type        = string
  default     = "public-ip"
}

variable "public_ip_sku" {
  description = "The SKU of the public IP address"
  type        = string
  default     = "Standard"
}

variable "public_ip_allocation_method" {
  description = "The allocation method for the public IP address"
  type        = string
  default     = "Static"
}
