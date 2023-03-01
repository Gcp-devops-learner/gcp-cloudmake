resource "google_project_iam_binding" "artifact_repo_admin" {
  role    = "roles/artifactregistry.repoAdmin"
  members = var.list_of_accounts_artifact_admin
}

resource "google_project_iam_binding" "artifact_repo_reader" {
  role    = "roles/artifactregistry.reader"
  members = var.list_of_accounts_artifact_readonly
}
