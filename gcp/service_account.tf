resource "google_service_account" "k8s_sa" {
  account_id   = "kubernetes-sa"
  display_name = "Kubernetes Service Account"
  project      = var.project
}