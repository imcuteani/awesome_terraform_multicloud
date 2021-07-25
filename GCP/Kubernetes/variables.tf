variable "project" {
  type = string
  description = "The GKE project name"
}

variable "region" {
  type = string
  description = "The GKE region name"
}

variable "zone" {
  type = string
  description = "The GKE zone name"
}

variable "service_account_id" {
  type = string
  description = "The Service account id for the Control Plane"
}

variable "service_display_name" {
  type = string
  description = "The Service account display name"
}

variable "primary_cluster_name" {
  type = string
  description = "The GKE primary cluster name"
}

variable "primary_cluster_location" {
  type = string
  description = "The primary GKE cluster location"
}

variable "node_pool_cluster_name" {
  type = string
 description = "The GKE node pool cluster name"

}


variable "node_machine_type" {
    type = string
    description = "The Cluster node machine type"
}
 
  
