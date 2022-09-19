module "terraform_project" {
  #checkov:skip=CKV_GCP_49:3rd party module
  #checkov:skip=CKV_GCP_62:3rd party module
  #checkov:skip=CKV_GCP_78:3rd party module
  #checkov:skip=CKV2_GCP_5:3rd party module
  source = "../../modules/formlabs.com/project-factory"

  project_name = "terraform"
  folder_id    = local.folder_ids["devops_prod"]

  labels = {
    environment = "prod"
    owner       = "devops"
    project     = "terraform"
  }
}

module "prod_network_project" {
  #checkov:skip=CKV_GCP_49:3rd party module
  #checkov:skip=CKV_GCP_62:3rd party module
  #checkov:skip=CKV_GCP_78:3rd party module
  #checkov:skip=CKV2_GCP_5:3rd party module
  source = "../../modules/formlabs.com/project-factory"

  project_name = "prod-network"
  folder_id    = local.folder_ids["devops_prod"]

  labels = {
    environment = "prod"
    owner       = "devops"
    project     = "network"
  }
}

module "dev_network_project" {
  #checkov:skip=CKV_GCP_49:3rd party module
  #checkov:skip=CKV_GCP_62:3rd party module
  #checkov:skip=CKV_GCP_78:3rd party module
  #checkov:skip=CKV2_GCP_5:3rd party module
  source = "../../modules/formlabs.com/project-factory"

  project_name = "dev-network"
  folder_id    = local.folder_ids["devops_dev"]

  labels = {
    environment = "dev"
    owner       = "devops"
    project     = "network"
  }
}
