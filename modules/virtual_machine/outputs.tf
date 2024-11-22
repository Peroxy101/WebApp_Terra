output "availability_set_id" {
  # Outputs the resource ID of the Availability Set.
  value       = azurerm_availability_set.web_avail_set.id
  description = "The ID of the Azure Availability Set."
}

output "web_vm_ids" {
  # Outputs the resource IDs of the Windows Virtual Machines.
  value       = azurerm_windows_virtual_machine.web_vm[*].id
  description = "The IDs of the Azure Windows Virtual Machines (Web)."
}

output "db_vm_id" {
  # Outputs the resource ID of the Database Virtual Machine.
  value       = azurerm_windows_virtual_machine.db_vm.id
  description = "The ID of the Azure Windows Virtual Machine (DB)."
}

output "web_nic_ids" {
  # Outputs the resource IDs of the Web Network Interfaces.
  value       = azurerm_network_interface.web_nic[*].id
  description = "The IDs of the Azure Network Interfaces for the Web VMs."
}

output "db_nic_id" {
  # Outputs the resource ID of the Database Network Interface.
  value       = azurerm_network_interface.db_nic.id
  description = "The ID of the Azure Network Interface for the DB VM."
}
