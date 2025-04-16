resource "google_compute_firewall" "allow-iap" {
  name    = "allow-ingress-from-iap"
  network = google_compute_network.my_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["35.235.240.0/20","10.0.0.0/16"]
  target_tags = ["allow-iap"]
}

/*resource "google_compute_firewall" "allow-access-from-laptop" {
  name    = "allow-ingress-from-laptop"
  network = google_compute_network.my_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }
  source_ranges = ["103.24.126.206/32"]
  target_tags = ["browser-access"]
}*/

resource "google_compute_firewall" "allow-egress" {
  name    = "allow-ingress-to-other-resources"
  network = google_compute_network.my_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22","80","8080","443"]
  }
  destination_ranges = ["10.0.32.0/19"]
  target_tags = ["allow-egress"]
}