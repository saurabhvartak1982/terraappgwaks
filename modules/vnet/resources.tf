
resource "azurerm_virtual_network" "aksvnet" {
  name                = var.virtual_network_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.virtual_network_address_prefix]

  tags = var.tags
}


resource "azurerm_subnet" "akssubnet" {
  name = var.aks_subnet_name
  virtual_network_name = azurerm_virtual_network.aksvnet.name
  resource_group_name  = var.resource_group_name
  address_prefixes = [var.aks_subnet_address_prefix]
}

resource "azurerm_subnet" "appgwsubnet" {
  name = var.appgw_subnet_name
  virtual_network_name = azurerm_virtual_network.aksvnet.name
  resource_group_name  = var.resource_group_name
  address_prefixes = [var.app_gateway_subnet_address_prefix]
}


