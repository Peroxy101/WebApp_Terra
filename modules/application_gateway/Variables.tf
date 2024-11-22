// variables.tf

// Defines the name of the Application Gateway.
variable "name" {
  // Description of the variable, explaining its purpose.
  description = "The name of the Application Gateway"
  // Specifies the type of the variable, in this case, a string.
  type        = string
  // Default value for the variable if not provided explicitly.
  default     = "app-gateway"
}

// Defines the location where the resources will be created.
variable "location" {
  // Description of the variable.
  description = "The location where the resources will be created"
  // Type of the variable, which is a string.
  type        = string
}

// Defines the name of the resource group.
variable "resource_group_name" {
  // Description of the variable.
  description = "The name of the resource group"
  // Type of the variable, which is a string.
  type        = string
}

// Defines the capacity of the Application Gateway.
variable "capacity" {
  // Description of the variable, explaining its role.
  description = "The capacity of the Application Gateway"
  // Type of the variable, which is a number.
  type        = number
  // Default value for the capacity, specifying the number of instances.
  default     = 2
}

// Defines the ID of the subnet to associate with the Application Gateway.
variable "subnet_id" {
  // Description of the variable.
  description = "The ID of the subnet to associate with the Application Gateway"
  // Type of the variable, which is a string.
  type        = string
}

// Defines the frontend port number for the Application Gateway.
variable "frontend_port" {
  // Description of the variable, explaining its use.
  description = "The frontend port number for the Application Gateway"
  // Type of the variable, which is a number.
  type        = number
  // Default port number for the frontend, typically HTTP port 80.
  default     = 80
}

// Defines the backend port number for the Application Gateway.
variable "backend_port" {
  // Description of the variable, explaining its role.
  description = "The backend port number for the Application Gateway"
  // Type of the variable, which is a number.
  type        = number
  // Default port number for the backend, typically HTTP port 80.
  default     = 80
}

// Defines the request timeout for the Application Gateway.
variable "request_timeout" {
  // Description of the variable, detailing its purpose.
  description = "The request timeout for the Application Gateway"
  // Type of the variable, which is a number.
  type        = number
  // Default value for the request timeout, in seconds.
  default     = 30
}

// Defines the name of the public IP associated with the Application Gateway.
variable "public_ip_name" {
  // Description of the variable, explaining its purpose.
  description = "The name of the public IP associated with the Application Gateway"
  // Type of the variable, which is a string.
  type        = string
  // Default name for the public IP resource.
  default     = "app-gateway-public-ip"
}


variable "sku-name" {
  description = "The name of the sku-name associated with the Application Gateway"
  type        = string
}

variable "sku-tier" {
  description = "The name of the sku-tier associated with the Application Gateway"
  type        = string
}

variable "gateway_ip_configuration" {
  description = "The name of the gateway_ip_configuration associated with the Application Gateway"
  type        = string
}

variable "name-frontend-port" {
  description = "The name of the frontend-port associated with the Application Gateway"
  type        = string
}

variable "name-frontend-ip-config" {
  description = "The name of the frontend-ip-config associated with the Application Gateway"
  type        = string
}

variable "app-gateway-backend-pool" {
  description = "The name of the app-gateway-backend-pool associated with the Application Gateway"
  type        = string
}

variable "backend_http-settings" {
  description = "The name of the backend_http-settings associated with the Application Gateway"
  type        = string
}

variable "cookie_based_affinity" {
  description = "The name of the cookie_based_affinity associated with the Application Gateway"
  type        = string
}

variable "protocol" {
  description = "The name of the protocol associated with the Application Gateway"
  type        = string
}

variable "http-listener" {
  description = "The name of the http-listener associated with the Application Gateway"
  type        = string
}

variable "frontend-ip-config" {
  description = "The name of the frontend-ip-config associated with the Application Gateway"
  type        = string
}

variable "frontend-port" {
  description = "The name of the frontend-port associated with the Application Gateway"
  type        = string
}

variable "name-routing-rule" {
  description = "The name of the name-routing-rule associated with the Application Gateway"
  type        = string
}

variable "rule_type" {
  description = "The name of the rule_type associated with the Application Gateway"
  type        = string
}

variable "backend-http-settings" {
  description = "The name of the backend-http-settings associated with the Application Gateway"
  type        = string
}

variable "allocation_method" {
  description = "The name of the allocation_method associated with the Application Gateway"
  type        = string
}

variable "public-sku" {
  description = "The name of the public-sku associated with the Application Gateway"
  type        = string
}