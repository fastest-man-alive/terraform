provider "google" {
    impersonate_service_account = "jenkins-sa@solo-levelling-arise.iam.gserviceaccount.com"
    project = var.project
    region = var.region
}