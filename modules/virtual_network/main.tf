resource "azurerm_virtual_network" "vnet" {
  # The name of the virtual network, constructed using the resource group name.
  name                = "${var.resource_group_name}-vnet"
  
  # The address space for the virtual network, specified as a list of CIDR blocks.
  address_space       = [var.vnet_address_space]
  
  # The Azure location where the virtual network will be deployed.
  location            = var.location
  
  # The name of the resource group in which the virtual network is deployed.
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "web_subnet" {
  # The name of the subnet for the web tier.
  name                 = "web-subnet"
  
  # The name of the resource group where the subnet is deployed.
  resource_group_name  = var.resource_group_name
  
  # The name of the virtual network to which this subnet belongs.
  virtual_network_name = azurerm_virtual_network.vnet.name
  
  # The address prefixes (CIDR blocks) for the subnet.
  address_prefixes     = [var.web_subnet_cidr]
}


resource "azurerm_subnet" "db_subnet" {
  # The name of the subnet for the database tier.
  name                 = "db-subnet"
  
  # The name of the resource group where the subnet is deployed.
  resource_group_name  = var.resource_group_name
  
  # The name of the virtual network to which this subnet belongs.
  virtual_network_name = azurerm_virtual_network.vnet.name
  
  # The address prefixes (CIDR blocks) for the subnet.
  address_prefixes     = [var.db_subnet_cidr]
}

