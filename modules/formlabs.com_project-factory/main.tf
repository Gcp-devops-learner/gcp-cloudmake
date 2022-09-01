/*
 * # GCP Project Factory for Formlabs.com acccount
 */

module "gcp_project" {
  #checkov:skip=CKV_GCP_49:3rd party module
  #checkov:skip=CKV_GCP_62:3rd party module
  #checkov:skip=CKV_GCP_78:3rd party module
  #checkov:skip=CKV2_GCP_5:3rd party module
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 13.1"

  name              = var.project_name
  org_id            = local.org_ids["formlabs_com"]
  folder_id         = var.folder_id
  random_project_id = true

  activate_apis           = var.activate_apis
  activate_api_identities = var.activate_api_identities

  billing_account = var.billing_account != "" ? var.billing_account : local.billing_account_ids["formlabs_sada"]

  labels = merge(
    local.common_labels,
    var.labels
  )
}
