variable "dataset_access_list" {
  type = list(object({
    role    = string
    type    = string # Can be "user", "group", or "serviceAccount"
    email   = string
  }))
  default = [
    { role = "READER", type = "user", email = "user1@example.com" },
    { role = "OWNER", type = "group", email = "analytics-team@example.com" },
    { role = "WRITER", type = "serviceAccount", email = "my-service-account@my-project.iam.gserviceaccount.com" }
  ]
}

variable "region" {
    default = "us-central1"
    type = string
}

variable "project" {
    default = "solo-levelling-arise"
    type = string
}