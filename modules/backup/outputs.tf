output "vault_id" {
  description = "The ID of the Recovery Services vault"
  value       = azurerm_recovery_services_vault.vault.id
}

output "vault_name" {
  description = "The name of the Recovery Services vault"
  value       = azurerm_recovery_services_vault.vault.name
}
