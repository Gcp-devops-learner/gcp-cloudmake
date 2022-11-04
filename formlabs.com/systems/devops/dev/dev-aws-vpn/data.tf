data "aws_subnets" "dev_subnets" {
  filter {
    name   = "vpc-id"
    values = [local.aws_dev_vpc_id]
  }
}

data "google_compute_network" "dev_network" {
  name    = "dev-network"
  project = local.shared_network_project_id
}
