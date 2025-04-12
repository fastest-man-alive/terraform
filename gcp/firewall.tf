resource "google_compute_firewall" "allow-iap" {
  name    = "allow-ingress-from-iap"
  network = google_compute_network.my_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["35.235.240.0/20"]
  target_tags = ["allow-iap"]
}