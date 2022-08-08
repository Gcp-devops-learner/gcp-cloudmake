resource "google_storage_bucket" "terrafrom_state" {
  name          = "formlabs-terraform-gcp-state"
  location      = "us-east1"
  force_destroy = true

  encryption {
    default_kms_key_name = google_kms_crypto_key.terrafrom_state.id
  }

  versioning {
    enabled = true
  }

  # Ensure the KMS crypto-key IAM binding for the service account exists
  depends_on = [google_kms_crypto_key_iam_binding.binding]
}

resource "google_storage_bucket_iam_member" "atlantis_legacybucketreader" {
  bucket = google_storage_bucket.terrafrom_state.name
  role   = "roles/storage.legacyBucketReader"
  member = "serviceAccount:${google_service_account.atlantis.email}"
}

resource "google_storage_bucket_iam_member" "atlanits_objectadmin" {
  bucket = google_storage_bucket.terrafrom_state.name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.atlantis.email}"
}
