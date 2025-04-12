/*resource "google_storage_bucket" "test_bucket" {
    name = "terraform-test-bucket-kaustav"
    location = var.region
    storage_class = "STANDARD"
    project = var.project
}*/

resource "google_compute_instance" "ssh-instance" {
  name         = "my-private-instance"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  tags = ["allow-iap"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size = 50
    }
  }

  network_interface {
    network = google_compute_network.my_vpc.name
    subnetwork= google_compute_subnetwork.private.name
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = "kubernetes-sa@solo-levelling-arise.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
}

resource "google_compute_instance_iam_member" "private_instance_iam_binding" {
    project = var.project
    zone = var.zone
    instance = google_compute_instance.ssh-instance.name
    role    = "roles/compute.instanceAdmin.v1"
    member  = "user:talukdark555@gmail.com"
}