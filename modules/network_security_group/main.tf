resource "azurerm_network_security_group" "web_nsg" {
  # The name of the Network Security Group (NSG) for the web servers.
  name                = "web-nsg"
  # Location where the NSG will be deployed, specified by a variable.
  location            = var.location
  # Resource group in which the NSG will be created, specified by a variable.
  resource_group_name = var.resource_group_name

  # Security rule to allow HTTP traffic on port 80.
  security_rule {
    # The name of the security rule.
    name                       = "allow-http"
    # Priority of the rule; lower numbers are higher priority.
    priority                   = 1001
    # Direction of the traffic; "Inbound" for incoming traffic.
    direction                  = "Inbound"
    # Action to take when the rule matches; "Allow" to permit traffic.
    access                     = "Allow"
    # Protocol to which this rule applies; "Tcp" in this case.
    protocol                   = "Tcp"
    # Source port range, set to "*" to allow all source ports.
    source_port_range          = "*"
    # Destination port range, set to "80" for HTTP.
    destination_port_range     = "80"
    # Source address prefix, set to "*" to allow all sources.
    source_address_prefix      = "*"
    # Destination address prefix, set to "*" to allow all destinations.
    destination_address_prefix = "*"
  }

# Security rule to allow HTTPS traffic on port 443.
  security_rule {
    # The name of the security rule.
    name                       = "allow-https"
    # Priority of the rule; should be unique and higher than previous rules for same direction.
    priority                   = 1002
    # Direction of the traffic; "Inbound" for incoming traffic.
    direction                  = "Inbound"
    # Action to take when the rule matches; "Allow" to permit traffic.
    access                     = "Allow"
    # Protocol to which this rule applies; "Tcp" in this case.
    protocol                   = "Tcp"
    # Source port range, set to "*" to allow all source ports.
    source_port_range          = "*"
    # Destination port range, set to "443" for HTTPS.
    destination_port_range     = "443"
    # Source address prefix, set to "*" to allow all sources.
    source_address_prefix      = "*"
    # Destination address prefix, set to "*" to allow all destinations.
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_security_group" "db_nsg" {
  # The name of the Network Security Group (NSG) for the database servers.
  name                = "db-nsg"
  # Location where the NSG will be deployed, specified by a variable.
  location            = var.location
  # Resource group in which the NSG will be created, specified by a variable.
  resource_group_name = var.resource_group_name

  # Security rule to allow SQL Server traffic on port 1433.
  security_rule {
    # The name of the security rule.
    name                       = "allow-sql"
    # Priority of the rule; lower numbers are higher priority.
    priority                   = 1001
    # Direction of the traffic; "Inbound" for incoming traffic.
    direction                  = "Inbound"
    # Action to take when the rule matches; "Allow" to permit traffic.
    access                     = "Allow"
    # Protocol to which this rule applies; "Tcp" in this case.
    protocol                   = "Tcp"
    # Source port range, set to "*" to allow all source ports.
    source_port_range          = "*"
    # Destination port range, set to "1433" for SQL Server.
    destination_port_range     = "1433"
    # Source address prefix, limited to the address prefix of the web subnet.
    source_address_prefix      = azurerm_subnet.web_subnet.address_prefixes[0]
    # Destination address prefix, set to "*" to allow all destinations.
    destination_address_prefix = "*"
  }
}


resource "azurerm_subnet_network_security_group_association" "web_nsg_assoc" {
  # ID of the subnet to associate with the NSG.
  subnet_id                 = azurerm_subnet.web_subnet.id
  # ID of the NSG to associate with the subnet.
  network_security_group_id = azurerm_network_security_group.web_nsg.id
}


resource "azurerm_subnet_network_security_group_association" "db_nsg_assoc" {
  # ID of the subnet to associate with the NSG.
  subnet_id                 = azurerm_subnet.db_subnet.id
  # ID of the NSG to associate with the subnet.
  network_security_group_id = azurerm_network_security_group.db_nsg.id
}

