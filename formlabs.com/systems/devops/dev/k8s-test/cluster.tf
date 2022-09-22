data "google_client_config" "default" {}

module "cluster" {
  source = "../../../../../modules/formlabs.com/kubernetes-factory"
  #checkov:skip=CKV_GCP_24
  #checkov:skip=CKV_GCP_61
  #checkov:skip=CKV_GCP_25
  #checkov:skip=CKV_GCP_21
  #checkov:skip=CKV_GCP_67
  #checkov:skip=CKV_GCP_64
  #checkov:skip=CKV_GCP_66
  #checkov:skip=CKV_GCP_69
  #checkov:skip=CKV_GCP_10
  #checkov:skip=CKV_GCP_22
  #checkov:skip=CKV_GCP_68
  #checkov:skip=CKV_GCP_72
  #checkov:skip=CKV_GCP_9
  #checkov:skip=CKV_GCP_69
  #checkov:skip=CKV_GCP_74
  #checkov:skip=CKV_GCP_76

  project_id         = local.project_id
  cluster_name       = "k8s-test"
  kubernetes_version = "1.24.4-gke.800"

  labels = local.labels
}
