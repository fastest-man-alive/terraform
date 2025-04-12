resource "google_compute_firewall" "allow-iap" {
  name    = "allow-ingress-from-iap"
  network = google_compute_network.my_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_tags = ["allow-iap"]
}