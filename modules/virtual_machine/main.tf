resource "azurerm_availability_set" "web_avail_set" {
  # The name of the Availability Set.
  name                = "web-availability-set"
  
  # The Azure location where the Availability Set is deployed.
  location            = var.location
  
  # The name of the resource group in which the Availability Set is deployed.
  resource_group_name = var.resource_group_name
}


resource "azurerm_windows_virtual_machine" "web_vm" {
  # Specifies the number of VM instances to create.
  count               = 2
  
  # The name of the virtual machine, with an index for uniqueness.
  name                = "web-vm-${count.index}"
  
  # The name of the resource group where the VM is deployed.
  resource_group_name = var.resource_group_name
  
  # The Azure location where the VM is deployed.
  location            = var.location
  
  # The size of the virtual machine (SKU) to determine its resources.
  size                = "Standard_D2s_v3"
  
  # The administrator username for the VM.
  admin_username      = var.admin_username
  
  # The administrator password for the VM.
  admin_password      = var.admin_password
  
  # Associates the VM with an Availability Set.
  availability_set_id = azurerm_availability_set.web_avail_set.id

  # The network interfaces associated with the VM.
  network_interface_ids = [
    azurerm_network_interface.web_nic[count.index].id
  ]

  # Configuration for the operating system disk.
  os_disk {
    # The name of the OS disk, with an index for uniqueness.
    name                = "web-os-disk-${count.index}"
    
    # Caching option for the OS disk.
    caching             = "ReadWrite"
    
    # The type of storage account for the OS disk.
    storage_account_type = "Premium_LRS"
    
    # The size of the OS disk in gigabytes.
    disk_size_gb        = 128
  }

  # Reference to the source image for the VM's operating system.
  source_image_reference {
    # The publisher of the image.
    publisher = "MicrosoftWindowsServer"
    
    # The offer of the image.
    offer     = "WindowsServer"
    
    # The SKU of the image.
    sku       = "2019-Datacenter"
    
    # The version of the image, set to the latest.
    version   = "latest"
  }
}


resource "azurerm_network_interface" "web_nic" {
  # Specifies the number of network interfaces to create.
  count               = 2
  
  # The name of the network interface, with an index for uniqueness.
  name                = "web-nic-${count.index}"
  
  # The Azure location where the network interface is deployed.
  location            = var.location
  
  # The name of the resource group in which the network interface is deployed.
  resource_group_name = var.resource_group_name

  # IP configuration settings for the network interface.
  ip_configuration {
    # The name of the IP configuration.
    name                          = "web-nic-config"
    
    # The ID of the subnet where the network interface is deployed.
    subnet_id                     = azurerm_subnet.web_subnet.id
    
    # Allocation method for the private IP address.
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_windows_virtual_machine" "db_vm" {
  # The name of the database virtual machine.
  name                = "db-vm"
  
  # The name of the resource group where the VM is deployed.
  resource_group_name = var.resource_group_name
  
  # The Azure location where the VM is deployed.
  location            = var.location
  
  # The size of the virtual machine (SKU) to determine its resources.
  size                = "Standard_D4s_v3"
  
  # The administrator username for the VM.
  admin_username      = var.admin_username
  
  # The administrator password for the VM.
  admin_password      = var.admin_password

  # The network interfaces associated with the VM.
  network_interface_ids = [
    azurerm_network_interface.db_nic.id
  ]

  # Configuration for the operating system disk.
  os_disk {
    # The name of the OS disk.
    name                = "db-os-disk"
    
    # Caching option for the OS disk.
    caching             = "ReadWrite"
    
    # The type of storage account for the OS disk.
    storage_account_type = "Premium_LRS"
    
    # The size of the OS disk in gigabytes.
    disk_size_gb        = 256
  }

  # Reference to the source image for the VM's operating system.
  source_image_reference {
    # The publisher of the image.
    publisher = "MicrosoftWindowsServer"
    
    # The offer of the image.
    offer     = "WindowsServer"
    
    # The SKU of the image.
    sku       = "2019-Datacenter"
    
    # The version of the image, set to the latest.
    version   = "latest"
  }
}

resource "azurerm_network_interface" "db_nic" {
  # The name of the network interface.
  name                = "db-nic"
  
  # The Azure location where the network interface is deployed.
  location            = var.location
  
  # The name of the resource group in which the network interface is deployed.
  resource_group_name = var.resource_group_name

  # IP configuration settings for the network interface.
  ip_configuration {
    # The name of the IP configuration.
    name                          = "db-nic-config"
    
    # The ID of the subnet where the network interface is deployed.
    subnet_id                     = azurerm_subnet.db_subnet.id
    
    # Allocation method for the private IP address.
    private_ip_address_allocation = "Dynamic"
  }
}

