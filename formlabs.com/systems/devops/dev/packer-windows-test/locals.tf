locals {
  project_id = "jenkins-packer-66e3"
  region     = "us-east1"
  labels = merge(
    local.common_labels,
    {
      environment = "dev"
      owner       = "devops"
      project     = "packer-windows-test"
    }
  )
}
