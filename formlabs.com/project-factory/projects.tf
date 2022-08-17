module "terraform_project" {
  source = "../../modules/formlabs_com_project_factory"

  project_name = "terraform"
  folder_id    = local.folder_ids["devops_prod"]

  labels = {
    Environment = "Prod"
    Owner       = "DevOps"
    Project     = "Terraform"
  }
}
