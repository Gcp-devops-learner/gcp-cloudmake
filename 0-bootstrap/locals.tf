locals {
  common_folder_id     = "folders/120065008570"
  org_id               = local.org_ids["formlabs_com"]
  billing_account      = local.billing_account_ids["formlabs_master"]
  default_region       = "us-east1"
  group_org_admins     = "gcp-billing-admins@formlabs.com"
  group_billing_admins = "gcp-billing-admins@formlabs.com"
  project_prefix       = "bootstrap"
  folder_prefix        = "tf"
}
