locals {
  project_id = "terraform-89df"

  labels = merge(
    local.common_labels,
    {
      environment = "prod"
      owner       = "devops"
      project     = "terraform"
    }
  )
}
