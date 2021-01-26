variable "resource_group_name" {
  description = "Name of the resource group."
}

variable "location" {
  description = "Location of the cluster."
}


variable "virtual_network_name" {
  description = "Virtual network name"
  default     = "aksvnet"
}

variable "appgw_subnet_name" {
  description = "Appgw Subnet Name."
  default     = "appgwsubnet"
}

variable "appgw_pip_name" {
  description = "Appgw IP name"
  default = "Appgwpip1"
}

variable "pip_allocation_method" {
  description = "PIP allocation method"
  default = "Static"
}

variable "pip_sku" {
  description = "PIP SKU"
  default = "Standard"
}



variable "app_gateway_name" {
  description = "Name of the Application Gateway"
  default = "ApplicationGateway1"
}

variable "app_gateway_sku" {
  description = "Name of the Application Gateway SKU"
  default = "Standard_v2"
}

variable "app_gateway_tier" {
  description = "Tier of the Application Gateway tier"
  default = "Standard_v2"
}

variable "app_gateway_capacity" {
  description = "Capacity of the Application Gateway"
  default = 2
}

variable "appgw_subnet_id" {
  description = "Appgw subnet id"
  
}



variable "tags" {
  type = map(string)

  default = {
    source = "terraform"
  }
}



