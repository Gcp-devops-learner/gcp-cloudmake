output "gcp_vpc_id" {
  value       = module.vpc.network_id
  description = "The name of the GCP project."
}

output "gcp_vpc_subnets" {
  value       = module.vpc.subnets
  description = "A map with keys of form subnet_region/subnet_name and values being the outputs of the google_compute_subnetwork resources used to create corresponding subnets."
}
