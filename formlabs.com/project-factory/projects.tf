module "terraform_project" {
  source = "../../modules/formlabs.com_project-factory"

  project_name = "terraform"
  folder_id    = local.folder_ids["devops_prod"]

  labels = {
    environment = "prod"
    owner       = "devops"
    project     = "terraform"
  }
}
