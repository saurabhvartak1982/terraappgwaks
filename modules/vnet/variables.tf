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

variable "virtual_network_address_prefix" {
  description = "VNET address prefix"
  default     = "172.18.0.0/16"
}

variable "aks_subnet_name" {
  description = "Subnet Name."
  default     = "kubesubnet"
}

variable "appgw_subnet_name" {
  description = "Subnet Name."
  default     = "appgwsubnet"
}


variable "aks_subnet_address_prefix" {
  description = "Subnet address prefix."
  default     = "172.18.1.0/24"
}

variable "app_gateway_subnet_address_prefix" {
  description = "Subnet server IP address."
  default     = "172.18.2.0/24"
}

variable "tags" {
  type = map(string)

  default = {
    source = "terraform"
  }
}
