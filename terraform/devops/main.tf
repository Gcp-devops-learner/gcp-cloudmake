module "project-factory" {
  source                  = "terraform-google-modules/project-factory/google"
  random_project_id       = true
  name                    = "test-project-gke"
  org_id                  = "206571043701"
  billing_account         = "0106F8-CD8198-6CEE90"
  default_service_account = "deprivilege"
}
