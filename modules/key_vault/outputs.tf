// Define output variables for the Key Vault module
output "key_vault_id" {
  description = "The ID of the created Key Vault"
  value       = azurerm_key_vault.example.id
}

output "key_vault_uri" {
  description = "The URI of the created Key Vault"
  value       = azurerm_key_vault.example.vault_uri
}

