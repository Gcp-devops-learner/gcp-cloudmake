module "project_devops_prod_terraform" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 13.0"

  name      = "terraform"
  org_id    = local.org_ids["formlabs_com"]
  folder_id = local.folder_ids["devops_prod"]

  billing_account = local.billing_account_ids["formlabs_sada"]

  labels = merge(
    local.common_labels,
    {
      Environment = "Prod"
      Owner       = "DevOps"
      Project     = "Terraform"
    }
  )
}
