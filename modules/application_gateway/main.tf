resource "azurerm_application_gateway" "app_gateway" {
  # Name of the Application Gateway resource.
  name                = var.name
  # Location where the Application Gateway will be deployed.
  location            = var.location
  # Resource group in which the Application Gateway will be created.
  resource_group_name = var.resource_group_name

  # Define the SKU (stock-keeping unit) for the Application Gateway.
  sku {
    # The SKU name for the Application Gateway.
    name     = var.sku-name
    # The SKU tier for the Application Gateway.
    tier     = var.sku-tier
    # The capacity of the Application Gateway, representing the number of instances.
    capacity = 2
  }

  # Configuration for the gateway IP settings.
  gateway_ip_configuration {
    # Name of the IP configuration for the Application Gateway.
    name      = var.gateway_ip_configuration
    # ID of the subnet where the Application Gateway will be deployed.
    subnet_id = azurerm_subnet.web_subnet.id
  }

  # Define the frontend port for the Application Gateway.
  frontend_port {
    # Name of the frontend port configuration.
    name = var.name-frontend-port
    # Port number to listen for incoming traffic.
    port = var.frontend_port
  }

  # Configuration for the frontend IP address of the Application Gateway.
  frontend_ip_configuration {
    # Name of the frontend IP configuration.
    name                 = var.name-frontend-ip-config
    # ID of the public IP address associated with the Application Gateway.
    public_ip_address_id = azurerm_public_ip.app_gateway_public_ip.id
  }

  # Define the backend address pool for routing traffic to backend servers.
  backend_address_pool {
    # Name of the backend address pool.
    name = var.app-gateway-backend-pool
  }

  # Configuration for backend HTTP settings, determining how traffic is routed to backend servers.
  backend_http_settings {
    # Name of the HTTP settings configuration.
    name                  = var.backend_http-settings
    # Setting for cookie-based session affinity (Disabled here).
    cookie_based_affinity = var.cookie_based_affinity
    # Port on which the backend server is listening.
    port                  = 80
    # Protocol used to communicate with the backend servers.
    protocol              = var.protocol
    # Timeout for backend requests in seconds.
    request_timeout       = var.request_timeout
  }

  # Define an HTTP listener for the Application Gateway.
  http_listener {
    # Name of the HTTP listener configuration.
    name                           = var.http-listener
    # Name of the frontend IP configuration used by this listener.
    frontend_ip_configuration_name = var.frontend-ip-config
    # Name of the frontend port used by this listener.
    frontend_port_name             = var.frontend-port
    # Protocol to be used by the listener.
    protocol                       = var.protocol
  }

  # Configuration for routing rules to determine how requests are routed to backend pools.
  request_routing_rule {
    # Name of the routing rule.
    name                       = var.name-routing-rule
    # Type of the rule (Basic or Path-based).
    rule_type                  = var.rule_type
    # Name of the HTTP listener to which this rule applies.
    http_listener_name         = var.http-listener
    # Name of the backend address pool to which requests are forwarded.
    backend_address_pool_name  = var.app-gateway-backend-pool
    # Name of the backend HTTP settings used by this rule.
    backend_http_settings_name = var.backend-http-settings
  }
}

resource "azurerm_public_ip" "app_gateway_public_ip" {
  # Name of the Public IP resource.
  name                = var.public_ip_name
  # Location where the Public IP will be deployed.
  location            = var.location
  # Resource group in which the Public IP will be created.
  resource_group_name = var.resource_group_name
  # Method of IP address allocation (Static or Dynamic).
  allocation_method   = var.allocation_method
  # SKU of the Public IP address, determining its features.
  sku                 = var.public-sku
}
