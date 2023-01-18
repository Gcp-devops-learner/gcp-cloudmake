module "terraform_project" {
  #checkov:skip=CKV_GCP_49
  #checkov:skip=CKV_GCP_62
  #checkov:skip=CKV_GCP_78
  #checkov:skip=CKV2_GCP_5
  source = "../../modules/formlabs.com/project-factory"

  project_name = "terraform"
  folder_id    = local.folder_ids["devops_prod"]

  activate_apis = [
    "container.googleapis.com"
  ]

  labels = {
    environment = "prod"
    owner       = "devops"
    project     = "terraform"
  }
}

module "k8s_test_project" {
  #checkov:skip=CKV_GCP_49
  #checkov:skip=CKV_GCP_62
  #checkov:skip=CKV_GCP_78
  #checkov:skip=CKV2_GCP_5
  source = "../../modules/formlabs.com/project-factory"

  project_name = "k8s-test"
  folder_id    = local.folder_ids["devops_dev"]

  activate_apis = [
    "container.googleapis.com"
  ]

  labels = {
    environment = "dev"
    owner       = "devops"
    project     = "k8s-test"
  }
}

module "prod_network_project" {
  #checkov:skip=CKV_GCP_49
  #checkov:skip=CKV_GCP_62
  #checkov:skip=CKV_GCP_78
  #checkov:skip=CKV2_GCP_5
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
  #checkov:skip=CKV_GCP_49
  #checkov:skip=CKV_GCP_62
  #checkov:skip=CKV_GCP_78
  #checkov:skip=CKV2_GCP_5
  source = "../../modules/formlabs.com/project-factory"

  project_name = "dev-network"
  folder_id    = local.folder_ids["devops_dev"]

  labels = {
    environment = "dev"
    owner       = "devops"
    project     = "network"
  }
}

module "prod_vpn_project" {
  #checkov:skip=CKV_GCP_49
  #checkov:skip=CKV_GCP_62
  #checkov:skip=CKV_GCP_78
  #checkov:skip=CKV2_GCP_5
  source = "../../modules/formlabs.com/project-factory"

  project_name = "prod-aws-vpn"
  folder_id    = local.folder_ids["devops_prod"]

  labels = {
    environment = "prod"
    owner       = "devops"
    project     = "network"
  }
}

module "dev_vpn_project" {
  #checkov:skip=CKV_GCP_49
  #checkov:skip=CKV_GCP_62
  #checkov:skip=CKV_GCP_78
  #checkov:skip=CKV2_GCP_5
  source = "../../modules/formlabs.com/project-factory"

  project_name = "dev-aws-vpn"
  folder_id    = local.folder_ids["devops_dev"]

  labels = {
    environment = "dev"
    owner       = "devops"
    project     = "network"
  }
}

module "dev_cloudlogging_system_test_project" {
  #checkov:skip=CKV_GCP_49
  #checkov:skip=CKV_GCP_62
  #checkov:skip=CKV_GCP_78
  #checkov:skip=CKV2_GCP_5
  source = "../../modules/formlabs.com/project-factory"

  project_name = "k8s-test"
  folder_id    = local.folder_ids["systems_dev"]

  activate_apis = [
    "logging.googleapis.com"
  ]

  labels = {
    environment = "dev"
    owner       = "systems"
    project     = "cloudlogging-test"
  }
}

module "packer_windows_machine_test_project" {
  #checkov:skip=CKV_GCP_49
  #checkov:skip=CKV_GCP_62
  #checkov:skip=CKV_GCP_78
  #checkov:skip=CKV2_GCP_5
  source = "../../modules/formlabs.com/project-factory"

  project_name = "packer-windows-machine-test"
  folder_id    = local.folder_ids["devops_dev"]

  labels = {
    environment = "prod"
    owner       = "devops"
    project     = "jenkins"
  }
}
