/*resource "google_dataproc_cluster" "my-dp-cluster" {
  name   = var.cluster_name
  region = var.region

  cluster_config {
    master_config {
      num_instances = 1
      machine_type  = "n1-standard-2"
    }

    worker_config {
      num_instances = 2
      machine_type  = "n1-standard-2"
    }

    software_config {
      image_version = "2.0-debian10"  # Example version, can vary
      optional_components = ["JUPYTER"]
      properties = {
        "spark:spark.executor.memory" = "2g"
      }
    }

    gce_cluster_config {
      subnetwork       = var.subnetwork
      service_account  = var.service_account_email
      tags             = ["dataproc"]
    }
  }
}*/
