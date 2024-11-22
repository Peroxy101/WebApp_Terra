output "security_center_pricing_id" {
  # Output the ID of the azurerm_security_center_subscription_pricing resource
  value = azurerm_security_center_subscription_pricing.standard.id
  description = "The ID of the Azure Security Center subscription pricing."
}

output "security_center_contact_id" {
  # Output the ID of the azurerm_security_center_contact resource
  value = azurerm_security_center_contact.contact.id
  description = "The ID of the Azure Security Center contact."
}
