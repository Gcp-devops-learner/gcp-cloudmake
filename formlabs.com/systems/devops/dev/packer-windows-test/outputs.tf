output "cloud_build_service_account_key" {
  value     = google_service_account_key.cloud_build_service_account_key.private_key
  sensitive = true
}
