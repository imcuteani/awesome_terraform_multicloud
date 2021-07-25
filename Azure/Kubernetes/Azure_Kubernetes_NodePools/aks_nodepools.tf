# Create Azure Resource Group

resource "azurerm_resource_group" "example" {
  name     = "${var.Resource_group}"
  location = "${var.location}"
  tags     = "${var.Resource_group_tags}"
}

# Create Azure Kubernetes Cluster 
resource "azurerm_kubernetes_cluster" "example" {
  #name                = "${random_pet.prefix.id}-aks"             // for terraform version >= 0.14+
  name                = "${var.az_aks_cluster_name}" // for terraform version <= 0.13
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  #dns_prefix          = "${random_pet.prefix.id}-k8s"
  dns_prefix = "az-aks-nodepools-dns"


  default_node_pool {
    name                = "nodepool"
    node_count          = 2
    vm_size             = "Standard_D2_V2"
    os_disk_size_gb     = 30
    enable_auto_scaling = true
    max_count           = 4
    min_count           = 1
    upgrade_settings {
      max_surge = 70 // maximum no of or % of nodes added to the node pool during upgrade
    }

  }

  service_principal {
    client_id     = var.appId
    client_secret = var.appsecret
  }

  role_based_access_control {
    enabled = true
  }

  addon_profile {
    kube_dashboard {
      enabled = false
    }
  }


  tags = {
    environment = "Production"
    costcenter  = "1005623487"
  }

}

#Create Azure Kubernetes Cluster node pool

resource "azurerm_kubernetes_cluster_node_pool" "example" {
  # name                          = "${random_pet.prefix.id}-akspool"             // for terraform version >= 0.14+
  name                  = "${var.azurerm_kubernetes_cluster_nodepool_name}" // for Terraform version <0.14
  kubernetes_cluster_id = azurerm_kubernetes_cluster.example.id
  vm_size               = "Standard_DS2_v2"
  node_count            = 1


  tags = {
    environment = "Production"
    costcenter  = "1005623487"
  }

}
