resource "google_cloud_run_v2_service" "default" {
  name     = "cloudrun-service"
  location = var.region
  ingress = "INGRESS_TRAFFIC_ALL"

  template {
    containers {
      ports {
        container_port = 80
      }        
      image = "nginx:latest"
      resources {
        limits = {
          cpu    = "2"
          memory = "1024Mi"
        }
      }
    }
  }
}

resource "google_cloud_run_service_iam_member" "run_all_users" {
  service  = google_cloud_run_v2_service.default.name
  location = google_cloud_run_v2_service.default.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}

output "cloud_run_url" {
  value = google_cloud_run_v2_service.default.uri
}

