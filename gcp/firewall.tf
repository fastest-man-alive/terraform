/*resource "google_compute_firewall" "allow-iap" {
  name    = "allow-ingress-from-iap"
  network = google_compute_network.my_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["35.235.240.0/20"]
  target_tags = ["allow-iap"]
}*/

/*resource "google_compute_firewall" "allow-access-from-laptop" {
  name    = "allow-ingress-from-laptop"
  network = google_compute_network.my_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }
  source_ranges = [""]
  target_tags = ["browser-access"]
}*/

/*resource "google_compute_firewall" "allow-egress" {
  name    = "allow-ingress-to-other-resources"
  network = google_compute_network.my_vpc.name

  direction = "EGRESS"
  priority  = 1000

  allow {
    protocol = "tcp"
    ports    = ["22","80","8080","443"]
  }
  destination_ranges = ["10.0.32.0/19"]
  target_tags = ["allow-egress"]
}*/

/*resource "google_compute_firewall" "allow_ingress_rule" {
  name    = "allow-ingress-from-internal-ip"
  network = google_compute_network.my_vpc.name

  direction = "INGRESS"
  priority  = 1000

  # Allow traffic from a specific source IP or CIDR block
  source_ranges = ["10.0.32.0/19"]  # Replace with trusted external IP(s)

  allow {
    protocol = "tcp"
    ports    = ["80", "443", "22","8080"]  # HTTP/HTTPS or other needed ports
  }

  # Optional: Restrict which instances/pods this applies to
  target_tags = ["allow-ingress"]  # VM or GKE node tags
}*/