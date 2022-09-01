resource "google_service_account" "atlantis" {
  account_id   = "atlantis"
  display_name = "Atlantis"
}

resource "google_service_account_key" "atlantis" {
  service_account_id = google_service_account.atlantis.name
}

resource "google_organization_iam_member" "atlantis" {
  #checkov:skip=CKV_GCP_45: Skip it because atlantis is needed to be create new projects
  org_id = local.org_ids["formlabs_com"]
  role   = "roles/owner"
  member = "serviceAccount:${google_service_account.atlantis.email}"
}
