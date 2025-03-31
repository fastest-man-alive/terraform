resource "google_container_cluster" "gke" {
  name                     = "my-cluster"
  location                 = var.region
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = google_compute_network.my_vpc.self_link
  subnetwork               = google_compute_subnetwork.private.self_link
  networking_mode          = "VPC_NATIVE"

  deletion_protection = false

  # Optional, if you want multi-zonal cluster
  # node_locations = ["us-central1-b"]

  addons_config {
    http_load_balancing {
      disabled = true
    }
    horizontal_pod_autoscaling {
      disabled = false
    }
  }

  release_channel {
    channel = "REGULAR"
  }

  workload_identity_config {
    workload_pool = "${var.project}.svc.id.goog"
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = "k8s-pods"
    services_secondary_range_name = "k8s-services"
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = "192.168.0.0/28"
  }

  # Jenkins use case
  # master_authorized_networks_config {
  #   cidr_blocks {
  #     cidr_block   = "10.0.0.0/18"
  #     display_name = "private-subnet"
  #   }
  # }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "my-node-pool"
  location   = var.region
  cluster    = google_container_cluster.gke.name
  node_count = 2

  node_config {
    preemptible  = true
    machine_type = "e2-medium"
    disk_size_gb = 50

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = "kubernetes-sa@solo-levelling-arise.iam.gserviceaccount.com"
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}