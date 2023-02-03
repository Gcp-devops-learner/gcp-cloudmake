module "terraform_project" {
  # checkov:skip=CKV_GCP_76 IPV6 not used
  # checkov:skip=CKV_GCP_74 Subnet private access already enabled
  source       = "../../../../../modules/vpc-factory"
  project_id   = "packer-windows-test-e0b0"
  network_name = "jenkins-packer"
  subnets = [
    {
      subnet_name           = "jenkins-packer-01"
      subnet_ip             = "10.235.5.0/24"
      subnet_region         = "us-east1"
      subnet_private_access = "true"
    }
  ]
  firewall_rules = [
    {
      name                    = "allow-winrm"
      direction               = "INGRESS"
      source_service_accounts = [google_service_account.cloud_build_service_account.email]
      allow = [
        {
          protocol = "tcp"
          ports    = ["5986"]
        }
      ]
    }
  ]
}

