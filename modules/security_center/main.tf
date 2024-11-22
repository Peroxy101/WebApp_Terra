resource "azurerm_security_center_subscription_pricing" "standard" {
  # The pricing tier for Azure Security Center.
  tier = var.pricing
  # The type of resource for which the pricing tier is being set.
  resource_type = var.resource_type
}


resource "azurerm_security_center_contact" "contact" {
  # Email address for security alerts and notifications.
  email = var.email
  # Phone number for security alerts and notifications.
  phone = var.phone
  # Boolean value indicating whether alert notifications are enabled.
  alert_notifications = var.alert_notifications
  # Boolean value indicating whether alerts are sent to subscription admins.
  alerts_to_admins = var.alerts_to_admins
}

