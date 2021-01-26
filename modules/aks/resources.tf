
# User Assigned Identities 
#resource "azurerm_user_assigned_identity" "testIdentity" {
#  resource_group_name = var.resource_group_name
#  location            = var.location

#  name = var.identityname

#  tags = var.tags
#}


resource "azurerm_role_assignment" "ra1" {
  scope                = var.aks_subnet_id
  role_definition_name = "Network Contributor"
  principal_id         = var.aks_service_principal_object_id 

}

#resource "azurerm_role_assignment" "ra2" {
#  scope                = azurerm_user_assigned_identity.testIdentity.id
#  role_definition_name = "Managed Identity Operator"
#  principal_id         = var.aks_service_principal_object_id
#  depends_on           = [azurerm_user_assigned_identity.testIdentity]
#}

resource "azurerm_kubernetes_cluster" "k8s" {
  name       = var.aks_name
  location   = var.location
  dns_prefix = var.aks_dns_prefix

  resource_group_name = var.resource_group_name

  linux_profile {
    admin_username = var.vm_user_name

    ssh_key {
      key_data = file(var.public_ssh_key_path)
    }
  }

  addon_profile {
    http_application_routing {
      enabled = false
    }
  }

  default_node_pool {
    name            = "agentpool"
    node_count      = var.aks_node_count
    max_pods = var.max_pods
    vm_size         = var.aks_agent_vm_size
    os_disk_size_gb = var.aks_agent_os_disk_size
    vnet_subnet_id  = var.aks_subnet_id
  }

  service_principal {
    client_id     = var.aks_service_principal_app_id
    client_secret = var.aks_service_principal_client_secret
  }

  network_profile {
    network_plugin     = "azure"
    dns_service_ip     = var.aks_dns_service_ip
    docker_bridge_cidr = var.aks_docker_bridge_cidr
    service_cidr       = var.aks_service_cidr
  }

  role_based_access_control {
    enabled = var.aks_enable_rbac
  }

  tags       = var.tags
}


