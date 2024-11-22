#module block for creating Vnet
module "virtual_network" {
  source              = "./modules/virtual_network"
  location            = var.location
  resource_group_name = var.resource_group_name
  vnet_address_space  = var.vnet_address_space
  web_subnet_cidr     = var.web_subnet_cidr
  db_subnet_cidr      = var.db_subnet_cidr
}
#module block for creating NSG
module "network_security_group" {
  source = "./modules/network_security_group"
  resource_group_name = var.resource_group_name
}
#module block for creating VMs
module "virtual_machine" {
  source              = "./modules/virtual_machine"
  location            = var.location
  resource_group_name = var.resource_group_name
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}
#module block for creating SQLDB
module "sql_database" {
  source = "./modules/sql_database"

  sql_server_name                 = var.sql_server_name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  administrator_login             = var.administrator_login
  administrator_password          = var.administrator_password
  sql_database_name               = var.sql_database_name
  pricing_tier                    = var.pricing_tier
  database_service_objective_name = var.database_service_objective_name
  database_size                   = var.database_size  # 2 GB
}
#module block for creating APPGateway
module "application_gateway" {
  source              = "./modules/application_gateway"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = azurerm_subnet.web_subnet.id
  capacity            = var.capacity
  frontend_port       = var.frontend_port
  backend_port        = var.backend_port
  request_timeout     = var.request_timeout
}
#module block for creating load balancer
module "load_balancer" {
  source = "./modules/load_balancer"
  public_ip_name              = var.public_ip_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  public_ip_allocation_method = var.public_ip_allocation_method
  public_ip_sku               = var.public_ip_sku
  frontend_ip_name            = var.frontend_ip_name
  backend_pool_name           = var.backend_pool_name
  probe_name                  = var.probe_name
  lb_rule_name                = var.lb_rule_name
  vm_ids                      = var.vm_ids
}

module "backup" {
  source                = "./modules/backup"
  
  # Assuming the module supports multiple IDs
  source_vm_ids          = [var.vm_ids]
  vault_name            = var.vault_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  sku_name              = var.sku_name
  policy_name           = var.policy_name
  backup_frequency      = var.backup_frequency
  backup_time           = var.backup_time
  retention_daily_count = var.retention_daily_count
}

#module block for creating keyvault
module "key_vault" {
  source              = "./modules/key_vault"
  key_vault_name      = var.key_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sql_server_password = var.sql_server_password
  connection_strings  = [var.connection_strings]
}
#module block for Security Center
module "security_center" {
  source = "./modules/security_center"
  location = var.location
  pricing = var.pricing_tier
  resource_group_name = var.resource_group_name
  resource_type       = var.resource_type
  email               = var.email
  phone               = var.phone
  alert_notifications = var.alert_notifications
  alerts_to_admins    = var.alerts_to_admins
}