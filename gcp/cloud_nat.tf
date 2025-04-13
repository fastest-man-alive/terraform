resource "google_compute_router" "my-router" {
  name   = "test-router"
  network = google_compute_network.my_vpc.name
  project = var.project
  region = var.region
}

resource "google_compute_router_nat" "internet_access" {
  name = "my-nat"
  router = google_compute_router.my-router.name
  nat_ip_allocate_option = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  project = var.project
  region = var.region
}