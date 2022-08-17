/*
 * # GCP Project Factory for Formlabs.com acccount
 */

module "gcp_project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 13.0"

  name      = var.project_name
  org_id    = local.org_id
  folder_id = var.folder_id

  activate_apis           = var.activate_apis
  activate_api_identities = var.activate_api_identities

  billing_account = var.billing_account != "" ? var.billing_account : local.billing_account_ids["formlabs_sada"]

  labels = merge(
    local.common_labels,
    var.labels
  )
}

