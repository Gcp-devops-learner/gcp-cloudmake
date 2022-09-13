module "gke" {
  source  = "terraform-google-modules/kubernetes-engine/google"
  version = "23.0.0"

  project_id                 = var.project_id
  name                       = var.cluster_name
  region                     = var.cluster_region
  zones                      = var.cluster_zones
  network                    = module.vpc.gcp_vpc_id
  subnetwork                 = local.netork_names["subnet"]
  ip_range_pods              = local.netork_names["pods"]
  ip_range_services          = local.netork_names["services"]
  http_load_balancing        = true
  network_policy             = true
  network_policy_provider    = "CALICO"
  horizontal_pod_autoscaling = true
  filestore_csi_driver       = true
  kubernetes_version         = var.kubernetes_version
  release_channel            = "UNSPECIFIED"
  logging_service            = "logging.googleapis.com/kubernetes"
  monitoring_service         = "monitoring.googleapis.com/kubernetes"
  remove_default_node_pool   = true

  node_pools = local.node_pools

  node_pools_oauth_scopes = {
    all = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }

  node_pools_labels = local.labels
}
