# General settings

variable "resource_group_name" {
  default = "tftest"
}

variable "location" {
  default = "southeastasia"
}



# VNet settings

variable "virtual_network_name" {
  default = "aksvnet"
}

variable "virtual_network_address_prefix" {
  default = "172.18.0.0/16"
}

variable "aks_subnet_name" {
  default = "kubesubnet"
}

variable "aks_subnet_address_prefix" {
  default = "172.18.1.0/24"
}

variable "appgw_subnet_name" {
  default = "appgwsubnet"
}

variable "app_gateway_subnet_address_prefix" {
  default = "172.18.2.0/24"
}

# AKS settings

variable "identityname" {
  default = "aksidentity1"
}

variable "aks_service_principal_app_id" {
  default = "<SP App Id>"
}

variable "aks_service_principal_client_secret" {
  default = "<SP Client Secret>"
}

variable "aks_service_principal_object_id" {
  default = "<SP Object Id>"
}

variable "aks_name" {
  default = "aks-cluster1"
}

variable "aks_dns_prefix" {
  default = "aks"
}

variable "aks_agent_os_disk_size" {
  default = 40
}

variable "aks_node_count" {
  default = 1
}

variable "aks_agent_vm_size" {
  default = "Standard_D3_v2" 
}

variable "kubernetes_version" {
  default = "1.18.14"
}

variable "aks_service_cidr" {
  default = "10.0.0.0/16"
}

variable "aks_dns_service_ip" {
  default = "10.0.0.10"
}

variable "aks_docker_bridge_cidr" {
  default = "172.17.0.1/16"
}

variable "aks_enable_rbac" {
  default = "true"
}

variable "max_pods" {
  default = 40
}

variable "vm_user_name" {
  default = "vmuser1"
}

variable "public_ssh_key_path" {
  default = "~/.ssh/id_rsa.pub"
}


# Appgw settings

variable "appgw_pip_name" {
  default = "appgwpip1"
}

variable "pip_allocation_method" {
  default = "Static"
}

variable "pip_sku" {
  default = "Standard"
}

variable "app_gateway_name" {
  default = "ApplicationGateway1"
}

variable "app_gateway_sku" {
  default = "Standard_v2"
}

variable "app_gateway_tier" {
  default = "Standard_v2"
}

variable "app_gateway_capacity" {
  default = 2
}

