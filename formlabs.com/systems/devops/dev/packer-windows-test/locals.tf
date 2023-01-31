locals {
  project_id = "packer-windows-test-e0b0"

  labels = merge(
    local.common_labels,
    {
      environment = "dev"
      owner       = "devops"
      project     = "packer-windows-test"
    }
  )
}
