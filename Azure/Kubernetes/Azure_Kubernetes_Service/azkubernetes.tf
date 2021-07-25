# Create Azure Resource Group

resource "azurerm_resource_group" "example" {
    name = "${var.Resource_group}"
    location = "${var.location}"
    tags = "${var.Resource_group_tags}"
}

# Create Azure Kubernetes Cluster 

resource "azurerm_kubernetes_cluster" "example" {
    name  = "${var.az_aks_cluster_name}"
    location = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
    dns_prefix = "az-aks-1"
    


    default_node_pool {
      name = "defaultnode"
      node_count = 1
      vm_size = "Standard_D2_V2"
      enable_auto_scaling = false
            
    }
   
              

    identity {
      type = "SystemAssigned"
    }

    tags = {
      Environment = "Dev-Test"
      Cost-center = "1000-11990"
    }
# Kubernetes cluster channel upgrade (in preview currently)

  # automatic_channel_upgrade = "stable"
    
  
}


