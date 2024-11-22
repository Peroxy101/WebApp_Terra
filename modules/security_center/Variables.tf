variable "resource_group_name" {
  # Description of the variable, explaining its purpose.
  description = "The name of the resource group"
  # Specifies the type of the variable, which is a string.
  type        = string
}


variable "location" {
  # Description of the variable, detailing where resources will be deployed.
  description = "The Azure location where resources will be deployed"
  # Type of the variable, specified as a string.
  type        = string
}


variable "email" {
  # Description of the variable, explaining its purpose.
  description = "The email address to receive Azure Security Center alerts"
  # Type of the variable, specified as a string.
  type        = string
}


variable "resource_type" {
  # Description of the variable, detailing the type of Azure resources.
  description = "The type of Azure resources for which pricing is set in the Security Center"
  # Type of the variable, specified as a string.
  type        = string
}

variable "pricing" {
  # Description of the variable, explaining its purpose.
  description = "The pricing tier for Azure Security Center services"
  # Type of the variable, specified as a string.
  type        = string
}


variable "phone" {
  # Description of the variable, explaining its purpose.
  description = "The phone number to receive Azure Security Center alerts"
  # Type of the variable, specified as a string.
  type        = string
}


variable "alert_notifications" {
  # Description of the variable, explaining its purpose.
  description = "Indicates whether email alert notifications are enabled"
  # Type of the variable, specified as a string.
  type        = string
}


variable "alerts_to_admins" {
  # Description of the variable, explaining its purpose.
  description = "Indicates whether alerts should also be sent to subscription administrators"
  # Type of the variable, specified as a string.
  type        = string
}