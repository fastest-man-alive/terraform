data "google_compute_router" "my-router" {
  name   = "test-router"
  network = google_compute_network.my_vpc.name
  project = var.project
  region = var.region
}

data "google_compute_router_nat" "internet_access" {
  name = "my-nat"
  router = google_compute_router.my-router.name
  project = var.project
  region = var.region
}