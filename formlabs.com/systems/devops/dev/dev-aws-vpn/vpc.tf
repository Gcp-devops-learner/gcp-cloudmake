module "dev_aws_vpn_network" {
  source = "../../../../../modules/vpc-factory"
  #checkov:skip=CKV_GCP_74
  #checkov:skip=CKV_GCP_76

  project_id   = local.project_id
  network_name = "dev-aws-vpn-network"
  subnets = [
    {
      subnet_name   = "dev-aws-vpn-subnet"
      subnet_ip     = "10.235.4.0/24"
      subnet_region = "us-east1"
    },
  ]
}

module "peering_vpcs" {
  source  = "terraform-google-modules/network/google//modules/network-peering"
  version = "~> 5.2"

  local_network              = module.dev_aws_vpn_network.gcp_vpc_network_self_link
  peer_network               = data.google_compute_network.dev_network.self_link
  export_local_custom_routes = true
  export_peer_custom_routes  = true
}
