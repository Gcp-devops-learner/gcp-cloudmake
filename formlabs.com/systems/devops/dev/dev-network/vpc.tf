module "dev_network" {
  source = "../../../../../modules/vpc-factory"
  #checkov:skip=CKV_GCP_74
  #checkov:skip=CKV_GCP_76

  project_id   = local.project_id
  network_name = "dev-network"
  subnets = [
    {
      subnet_name   = "dev-shared-network"
      subnet_ip     = "10.235.0.0/23"
      subnet_region = "us-east1"
    },
  ]
  shared_vpc_host = true
}
