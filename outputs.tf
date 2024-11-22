output "virtual_network_id" {
  value = module.virtual_network.vnet_id
  description = "The ID of the virtual network."
}

output "network_security_group_id" {
  value = module.network_security_group.nsg_id
  description = "The ID of the network security group."
}

output "virtual_machine_ids" {
  value = module.virtual_machine.vm_ids
  description = "The IDs of the virtual machines."
}

output "sql_database_id" {
  value = module.sql_database.sql_database_id
  description = "The ID of the SQL database."
}

output "application_gateway_id" {
  value = module.application_gateway.app_gateway_id
  description = "The ID of the application gateway."
}

output "load_balancer_id" {
  value = module.load_balancer.load_balancer_id
  description = "The ID of the load balancer."
}

output "backup_ids" {
  value = module.backup.backup_ids
  description = "The IDs of the backups."
}

output "key_vault_id" {
  value = module.key_vault.key_vault_id
  description = "The ID of the key vault."
}

output "security_center_id" {
  value = module.security_center.security_center_id
  description = "The ID of the security center."
}
