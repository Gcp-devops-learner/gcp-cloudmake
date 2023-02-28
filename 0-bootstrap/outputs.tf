output "seed_project_id" {
  description = "Project where service accounts and core APIs will be enabled."
  value       = module.bootstrap.seed_project_id
}

output "bootstrap_step_terraform_service_account_email" {
  description = "Bootstrap Step Terraform Account"
  value       = module.bootstrap.terraform_sa_email
}

output "networks_step_terraform_service_account_email" {
  description = "Networks Step Terraform Account"
  value       = module.bootstrap.terraform_sa_email
}

output "gcs_bucket_tfstate" {
  description = "Bucket used for storing terraform state for Foundations Pipelines in Seed Project."
  value       = module.bootstrap.gcs_bucket_tfstate
}

output "common_config" {
  description = "Common configuration data to be used in other steps."
  value = {
    org_id          = local.org_id,
    billing_account = local.billing_account,
    default_region  = local.default_region,
    project_prefix  = local.project_prefix,
    folder_prefix   = local.folder_prefix,
  }
}

output "group_org_admins" {
  description = "Google Group for GCP Organization Administrators."
  value       = local.group_org_admins
}

output "group_billing_admins" {
  description = "Google Group for GCP Billing Administrators."
  value       = local.group_billing_admins
}
