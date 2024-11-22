# Create an Azure Key Vault
resource "azurerm_key_vault" "example" {
  # Name of the Key Vault, specified by a variable.
  name                = var.key_vault_name
  # Location where the Key Vault will be deployed, specified by a variable.
  location            = var.location
  # Resource group in which the Key Vault will be created, specified by a variable.
  resource_group_name = var.resource_group_name
  # Tenant ID of the Azure Active Directory, dynamically retrieved.
  tenant_id           = data.azurerm_client_config.current.tenant_id
  # SKU name for the Key Vault, specifying the pricing tier and capabilities.
  sku_name            = "standard"

  # Access policy block to manage permissions for the Key Vault.
  access_policy {
    # Tenant ID for the access policy, dynamically retrieved.
    tenant_id = data.azurerm_client_config.current.tenant_id
    # Object ID for the user or application to grant permissions, dynamically retrieved.
    object_id = data.azurerm_client_config.current.object_id

    # List of permissions for managing secrets in the Key Vault.
    secret_permissions = [
      "get",    # Permission to read secrets.
      "list",   # Permission to list all secrets.
      "set",    # Permission to create or update secrets.
      "delete", # Permission to delete secrets.
    ]
  }

  # Network access control configuration for the Key Vault.
  network_acls {
    # Default action for requests not matching any specific rules (e.g., Allow or Deny).
    default_action = "Allow"
    # Specifies services that can bypass network rules.
    bypass         = "AzureServices"
    # List of IP addresses allowed to access the Key Vault.
    ip_rules       = ["<YOUR_IP_ADDRESS>"]
  }
}
