# # Locals block for hardcoded names. 
locals {
    backend_address_pool_name      = "${var.virtual_network_name}-beap"
    frontend_port_name             = "${var.virtual_network_name}-feport"
    frontend_ip_configuration_name = "${var.virtual_network_name}-feip"
    http_setting_name              = "${var.virtual_network_name}-be-htst"
    listener_name                  = "${var.virtual_network_name}-httplstn"
    request_routing_rule_name      = "${var.virtual_network_name}-rqrt"
    app_gateway_subnet_name = var.appgw_subnet_name
}

# Public Ip 
resource "azurerm_public_ip" "test" {
  name                         = var.appgw_pip_name
  location                     = var.location
  resource_group_name          = var.resource_group_name
  allocation_method            = var.pip_allocation_method
  sku                          = var.pip_sku

  tags = var.tags
}

resource "azurerm_application_gateway" "network" {
  name                = var.app_gateway_name
  resource_group_name = var.resource_group_name
  location            = var.location

  sku {
    name     = var.app_gateway_sku
    tier     = var.app_gateway_tier
    capacity = var.app_gateway_capacity
  }

  gateway_ip_configuration {
    name      = "appGatewayIpConfig"
    subnet_id = var.appgw_subnet_id
  }

  frontend_port {
    name = local.frontend_port_name
    port = 80
  }

  frontend_port {
    name = "httpsPort"
    port = 443
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.test.id
  }

  backend_address_pool {
    name = local.backend_address_pool_name
  }

  backend_http_settings {
    name                  = local.http_setting_name
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 1
  }

  http_listener {
    name                           = local.listener_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = local.request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.http_setting_name
  }

  tags = var.tags

}


