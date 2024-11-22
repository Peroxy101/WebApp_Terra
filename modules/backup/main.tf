resource "azurerm_recovery_services_vault" "vault" {
  # Name of the Recovery Services Vault, specified by a variable.
  name                = var.vault_name
  # Location where the Recovery Services Vault will be deployed, fetched from the resource group.
  location            = azurerm_resource_group.rg.location
  # Resource group in which the Recovery Services Vault will be created, fetched from the resource group.
  resource_group_name = azurerm_resource_group.rg.name
  # SKU name for the Recovery Services Vault, specified by a variable.
  sku                 = var.sku_name
}
resource "azurerm_backup_policy_vm" "policy" {
  # Name of the backup policy, specified by a variable.
  name                = var.policy_name
  # Name of the resource group where the backup policy is applied.
  resource_group_name = var.resource_group_name
  # Name of the Recovery Services Vault associated with this backup policy.
  recovery_vault_name = var.vault_name

  # Configuration for the backup schedule.
  backup {
    # Frequency of the backup (e.g., daily, weekly), specified by a variable.
    frequency = var.backup_frequency
    # Specific time when the backup should occur, specified by a variable.
    time      = var.backup_time
  }

  # Configuration for daily retention of backups.
  retention_daily {
    # Number of days to retain daily backups, specified by a variable.
    count = var.retention_daily_count
  }
}
