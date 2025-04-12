resource google_service_account_iam_binding "user_kubernetes_binding"{
    service_account_id = google_service_account.k8s_sa.name
    role               = "roles/iam.serviceAccountUser"

    members   = [
        "user:talukdark555@gmail.com"
    ]
}