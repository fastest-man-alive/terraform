provider "google" {
    impersonate_service_account = "your-sa-name"
    project = var.project
    region = var.region
}