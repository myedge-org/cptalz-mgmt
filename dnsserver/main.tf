# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_resolver_inbound_endpoint

# Reference existing resource group
data "azurerm_resource_group" "private_dns" {
  name = var.resource_group_name
}

# Reference existing virtual network
data "azurerm_virtual_network" "private_dns" {
  name                = var.virtual_network_name
  resource_group_name = var.resource_group_name
}

data "azurerm_subnet" "private_dns_subnet_inbound" {
  name                 = var.subnet_inbound_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
}

data "azurerm_subnet" "private_dns_subnet_outbound" {
  name                 = var.subnet_outbound_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
}

resource "azurerm_private_dns_resolver" "private_dns" {
  name                = var.name
  resource_group_name = data.azurerm_resource_group.private_dns.name
  location            = data.azurerm_resource_group.private_dns.location
  virtual_network_id  = data.azurerm_virtual_network.private_dns.id
}

resource "azurerm_private_dns_resolver_inbound_endpoint" "private_dns" {
  name                    = "${var.name}-inbound-endpoint"
  private_dns_resolver_id = azurerm_private_dns_resolver.private_dns.id
  location                = azurerm_private_dns_resolver.private_dns.location
  ip_configurations {
    private_ip_allocation_method = "Dynamic"
    subnet_id                    = data.azurerm_subnet.private_dns_subnet_inbound.id
  }
}

resource "azurerm_private_dns_resolver_outbound_endpoint" "private_dns" {
  name                    = "${var.name}-outbound-endpoint"
  private_dns_resolver_id = azurerm_private_dns_resolver.private_dns.id
  location                = azurerm_private_dns_resolver.private_dns.location
  subnet_id               = data.azurerm_subnet.private_dns_subnet_outbound.id
}
