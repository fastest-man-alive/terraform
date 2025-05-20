/*resource "google_project_iam_binding" "storage_admin" {
  project = var.project
  role    = "roles/storage.admin"

  members = [
    "serviceAccount:your-sa",
  ]
  depends_on = [google_service_account.k8s_sa]
}

resource "google_project_iam_binding" "artifact_registry_reader" {
  project = var.project
  role    = "roles/artifactregistry.reader"

  members = [
    "serviceAccount:your-sa",
  ]
}*/