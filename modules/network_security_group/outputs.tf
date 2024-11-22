output "web_nsg_id" {
  # Description of what this output represents.
  description = "The ID of the Network Security Group for web servers."
  # The value to output, in this case, the ID of the web NSG.
  value       = azurerm_network_security_group.web_nsg.id
}

output "db_nsg_id" {
  # Description of what this output represents.
  description = "The ID of the Network Security Group for database servers."
  # The value to output, in this case, the ID of the db NSG.
  value       = azurerm_network_security_group.db_nsg.id
}

output "web_nsg_rule_names" {
  # Description of what this output represents.
  description = "The names of the security rules in the web NSG."
  # The value to output, a list of security rule names.
  value       = azurerm_network_security_group.web_nsg.security_rule[*].name
}

output "db_nsg_rule_names" {
  # Description of what this output represents.
  description = "The names of the security rules in the database NSG."
  # The value to output, a list of security rule names.
  value       = azurerm_network_security_group.db_nsg.security_rule[*].name
}

output "web_subnet_nsg_association" {
  # Description of what this output represents.
  description = "The association between web subnet and its NSG."
  # The value to output, representing the association ID.
  value       = azurerm_subnet_network_security_group_association.web_nsg_assoc.id
}

output "db_subnet_nsg_association" {
  # Description of what this output represents.
  description = "The association between database subnet and its NSG."
  # The value to output, representing the association ID.
  value       = azurerm_subnet_network_security_group_association.db_nsg_assoc.id
}
