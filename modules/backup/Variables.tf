variable "resource_group_name" {
  // Description of the variable, explaining its purpose.
  description = "The name of the resource group"
  // Specifies the type of the variable, which is a string.
  type        = string
}


variable "location" {
  // Description of the variable, detailing where resources will be deployed.
  description = "The Azure location where resources will be deployed"
  // Type of the variable, specified as a string.
  type        = string
  // Default Azure location if not provided explicitly.
  default     = "East US"
}


variable "vault_name" {
  // Description of the variable, explaining its purpose.
  description = "The name of the Recovery Services vault"
  // Type of the variable, which is a string.
  type        = string
}


variable "sku_name" {
  // Description of the variable, detailing the SKU name.
  description = "The SKU name of the Recovery Services vault"
  // Type of the variable, specified as a string.
  type        = string
  // Default SKU name for the vault, set to "Standard".
  default     = "Standard"
}


variable "tags" {
  // Description of the variable, explaining its purpose for tagging resources.
  description = "Tags to be applied to the vault"
  // Type of the variable, defined as a map of strings.
  type        = map(string)
  // Default value for tags, set to an empty map.
  default     = {}
}


variable "source_vm_ids" {
  // Description of the variable, indicating it holds the VM ID.
  description = "The ID of the VM to be protected"
  // Type of the variable, which is a string.
  type        = string
}

variable "policy_name" {
  // Description of the variable, explaining its purpose.
  description = "The name of the backup policy"
  // Type of the variable, defined as a string.
  type        = string
}


variable "backup_frequency" {
  // Description of the variable, detailing the backup frequency.
  description = "The frequency of the backup"
  // Type of the variable, specified as a string.
  type        = string
  // Default frequency for backups, set to "Daily".
  default     = "Daily"
}


variable "backup_time" {
  // Description of the variable, indicating the backup timing.
  description = "The time of the backup"
  // Type of the variable, defined as a string.
  type        = string
  // Default time for backups, set to "23:00".
  default     = "23:00"
}


variable "retention_daily_count" {
  // Description of the variable, explaining the retention policy.
  description = "The number of days to retain daily backups"
  // Type of the variable, specified as a number.
  type        = number
  // Default retention period, set to 30 days.
  default     = 30
}
