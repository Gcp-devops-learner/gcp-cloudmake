module "terraform_project" {
  #checkov:skip=CKV_GCP_49:3rd party module
  #checkov:skip=CKV_GCP_62:3rd party module
  #checkov:skip=CKV_GCP_78:3rd party module
  #checkov:skip=CKV2_GCP_5:3rd party module
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
