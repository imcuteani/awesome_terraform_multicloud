# Resource block for Kubernetes Container Cluster

resource "google_service_account" "default_service_account" {
  account_id   = var.service_account_id
  display_name = var.service_display_name
}

resource "google_container_cluster" "primary_cluster" {
  name                     = var.primary_cluster_name
  location                 = var.primary_cluster_location
  remove_default_node_pool = true
  initial_node_count       = 1
}


# Define the GKE node pool 

resource "google_container_node_pool" "primary_preemptible_cluster" {
  name       = var.node_pool_cluster_name
  location   = google_container_cluster.primary_cluster.location
  cluster    = google_container_cluster.primary_cluster.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = var.node_machine_type

    service_account = google_service_account.default_service_account.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    labels = {
      "env" = "dev"
    }
    tags = ["env", "dev"]

  }
  timeouts {
    create = "30m"
    update = "45m"
  }
}