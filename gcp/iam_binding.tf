resource google_service_account_iam_binding "user_kubernetes_binding"{
    service_account_id = "kubernetes-sa@solo-levelling-arise.iam.gserviceaccount.com"
    role               = "roles/iam.serviceAccountUser"

    members   = [
        "user:talukdark555@gmail.com"
    ]
}