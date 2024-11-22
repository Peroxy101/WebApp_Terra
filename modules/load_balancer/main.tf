resource "azurerm_public_ip" "lb" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.public_ip_allocation_method
  sku                 = var.public_ip_sku
}

resource "azurerm_lb" "main" {
  name                = "web-tier-lb"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
}

resource "azurerm_lb_frontend_ip_configuration" "config" {
  name                 = var.frontend_ip_name
  loadbalancer_id      = azurerm_lb.main.id
  public_ip_address_id = azurerm_public_ip.lb.id
}

resource "azurerm_lb_backend_address_pool" "bap" {
  name                = var.backend_pool_name
  loadbalancer_id     = azurerm_lb.main.id
}

resource "azurerm_lb_probe" "http" {
  name                = var.probe_name
  loadbalancer_id     = azurerm_lb.main.id
  protocol            = "Http"
  port                = 80
  request_path        = "/"
  interval_in_seconds = 5
  number_of_probes    = 2
}

resource "azurerm_lb_rule" "http" {
  name                            = var.lb_rule_name
  loadbalancer_id                 = azurerm_lb.main.id
  frontend_ip_configuration_name  = azurerm_lb_frontend_ip_configuration.config.name
  probe_id                        = azurerm_lb_probe.http.id
  protocol                        = "Tcp"
  frontend_port                   = 80
  backend_port                    = 80
  idle_timeout_in_minutes         = 4
  enable_floating_ip              = false
}

resource "azurerm_network_interface_backend_address_pool_association" "vm_pool_association" {
  count = length(var.vm_ids)
  backend_address_pool_id = azurerm_lb_backend_address_pool.bap.id
  ip_configuration_name   = "testconfiguration1"
  network_interface_id    = element(var.vm_ids, count.index)
}

