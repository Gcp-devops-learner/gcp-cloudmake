/*
 * # GCP VPC Factory 
 * # Create VPC with given networks with access to the Internet 
 */

module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 5.2"

  project_id                             = var.project_id
  network_name                           = var.network_name
  subnets                                = var.subnets
  secondary_ranges                       = var.secondary_ranges
  firewall_rules                         = var.firewall_rules
  shared_vpc_host                        = var.shared_vpc_host
  routing_mode                           = "REGIONAL"
  auto_create_subnetworks                = false
  delete_default_internet_gateway_routes = true

  routes = [
    {
      name              = "egress-internet"
      description       = "Route through IGW to access internet"
      destination_range = "0.0.0.0/0"
      next_hop_internet = "true"
    }
  ]
}
