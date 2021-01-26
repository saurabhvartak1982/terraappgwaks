output "vnet_id" {
  value = azurerm_virtual_network.aksvnet.id
}

output "aks_subnet_id" {
  value = azurerm_subnet.akssubnet.id
}

output "appgw_subnet_id" {
  value = azurerm_subnet.appgwsubnet.id
}
