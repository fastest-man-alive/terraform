resource "google_bigquery_dataset" "my_dataset" {
  dataset_id                  = "my-dataset"
  friendly_name               = "test"
  description                 = "This dataset is private"
  location                    = var.region

  labels = {
    env = "default"
  }

  access {
    role          = "OWNER"
    user_by_email = google_service_account.bqowner.email
  }
  for_each = var.dataset_access_list
  dynamic {
      
  }

  access {
    dataset {
      dataset {
        project_id = google_bigquery_dataset.public.project
        dataset_id = google_bigquery_dataset.public.dataset_id
      }
      target_types = ["VIEWS"]
    }
  }
}