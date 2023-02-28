module "bootstrap" {
  source  = "terraform-google-modules/bootstrap/google"
  version = "~> 6.4"

  org_id               = local.org_id
  billing_account      = local.billing_account
  group_org_admins     = local.group_org_admins
  group_billing_admins = local.group_billing_admins
  default_region       = local.default_region
  parent_folder        = local.common_folder_id
  project_prefix       = local.project_prefix

  activate_apis = [
    "serviceusage.googleapis.com",
    "servicenetworking.googleapis.com",
    "compute.googleapis.com",
    "logging.googleapis.com",
    "bigquery.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "cloudbilling.googleapis.com",
    "iam.googleapis.com",
    "admin.googleapis.com",
    "appengine.googleapis.com",
    "storage-api.googleapis.com",
    "monitoring.googleapis.com",
    "cloudkms.googleapis.com",
  ]

  create_terraform_sa        = true
  tf_service_account_name    = "Formlabs Terraform Service Account"
  tf_service_account_id      = "forlambs-terraform"
  grant_billing_user         = false
  state_bucket_name          = "formlabs-terraform-state"
  encrypt_gcs_bucket_tfstate = true
  kms_prevent_destroy        = false
  sa_enable_impersonation    = false

  sa_org_iam_permissions = [
    "roles/billing.user",
    "roles/compute.networkAdmin",
    "roles/compute.xpnAdmin",
    "roles/iam.securityAdmin",
    "roles/iam.serviceAccountAdmin",
    "roles/logging.configWriter",
    "roles/orgpolicy.policyAdmin",
    "roles/resourcemanager.folderAdmin",
    "roles/resourcemanager.organizationViewer",
  ]

  project_labels = local.common_labels
}
