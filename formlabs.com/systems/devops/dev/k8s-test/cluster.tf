data "google_client_config" "default" {}

module "cluster" {
  source = "../../../../../modules/formlabs.com/kubernetes-factory"

  project_id         = local.project_id
  cluster_name       = "k8s-test"
  kubernetes_version = "1.24.4-gke.800"

  labels = local.labels
}
