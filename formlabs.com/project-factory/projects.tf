module "terraform_project" {
  source = "../../modules/formlabs.com_project-factory"

  project_name = "terraform"
  folder_id    = local.folder_ids["devops_prod"]

  activate_apis = [
    "cloudkms.googleapis.com",
    "compute.googleapis.com"
  ]

  labels = {
    environment = "prod"
    owner       = "devops"
    project     = "terraform"
  }
}
