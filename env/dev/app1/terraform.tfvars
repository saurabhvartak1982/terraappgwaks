# General settings
resource_group_name = "tftest"
location = "southeastasia"

# VNet settings
virtual_network_name = "aksvnet"
virtual_network_address_prefix = "172.18.0.0/16"
aks_subnet_name = "kubesubnet"
aks_subnet_address_prefix = "172.18.1.0/24"
appgw_subnet_name = "appgwsubnet"
app_gateway_subnet_address_prefix = "172.18.2.0/24"
identityname = "aksidentity1"
aks_service_principal_app_id = "<SP App Id>"
aks_service_principal_client_secret = "<SP Client Secret>"
aks_service_principal_object_id = "<SP Object Id>"
aks_name = "aks-cluster1"
aks_dns_prefix = "aks"
aks_agent_os_disk_size = 40
aks_node_count = 1
aks_agent_vm_size = "Standard_D3_v2"
kubernetes_version = "1.18.14"
aks_service_cidr = "10.0.0.0/16"
aks_dns_service_ip = "10.0.0.10"
aks_docker_bridge_cidr = "172.17.0.1/16"
aks_enable_rbac = "true"
max_pods = 40
vm_user_name = "vmuser1"
public_ssh_key_path = "~/.ssh/id_rsa.pub"

# Appgw settings 
appgw_pip_name = "appgwpip1"
pip_allocation_method = "Static"
pip_sku = "Standard"
app_gateway_name = "ApplicationGateway1"
app_gateway_sku = "Standard_v2"
app_gateway_tier = "Standard_v2"
app_gateway_capacity = 1
