module "aksvnet" {
  source = "../../../modules/vnet"
  resource_group_name = var.resource_group_name
  location = var.location
  virtual_network_name = var.virtual_network_name
  virtual_network_address_prefix = var.virtual_network_address_prefix
  aks_subnet_name = var.aks_subnet_name
  aks_subnet_address_prefix = var.aks_subnet_address_prefix
  appgw_subnet_name = var.appgw_subnet_name
  app_gateway_subnet_address_prefix = var.app_gateway_subnet_address_prefix

}

module "akscluster" {
  source = "../../../modules/aks"
  resource_group_name = var.resource_group_name
  location = var.location
  identityname = var.identityname
  aks_service_principal_app_id = var.aks_service_principal_app_id
  aks_service_principal_client_secret = var.aks_service_principal_client_secret
  aks_service_principal_object_id = var.aks_service_principal_object_id
  virtual_network_id = module.aksvnet.vnet_id
  aks_subnet_id = module.aksvnet.aks_subnet_id
  aks_name = var.aks_name
  aks_dns_prefix = var.aks_dns_prefix
  aks_agent_os_disk_size = var.aks_agent_os_disk_size
  aks_node_count = var.aks_node_count
  aks_agent_vm_size = var.aks_agent_vm_size
  kubernetes_version = var.kubernetes_version
  aks_service_cidr = var.aks_service_cidr
  aks_dns_service_ip = var.aks_dns_service_ip
  aks_docker_bridge_cidr = var.aks_docker_bridge_cidr
  aks_enable_rbac = var.aks_enable_rbac
  max_pods = var.max_pods
  vm_user_name = var.vm_user_name
  public_ssh_key_path = var.public_ssh_key_path

}

module "appgw" {
  source = "../../../modules/appgw"
  resource_group_name = var.resource_group_name
  location = var.location
  virtual_network_name = var.virtual_network_name
  appgw_subnet_name = var.appgw_subnet_name
  appgw_pip_name = var.appgw_pip_name
  pip_allocation_method = var.pip_allocation_method
  pip_sku = var.pip_sku
  app_gateway_name = var.app_gateway_name
  app_gateway_sku = var.app_gateway_sku
  app_gateway_tier = var.app_gateway_tier
  app_gateway_capacity = var.app_gateway_capacity
  appgw_subnet_id = module.aksvnet.appgw_subnet_id

}
