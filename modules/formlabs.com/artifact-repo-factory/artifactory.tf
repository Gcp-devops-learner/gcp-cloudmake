resource "google_artifact_registry_repository" "artifact_repo" {
  location      = var.region
  repository_id = var.repository_id
  description   = var.description
  format        = "DOCKER"
}
