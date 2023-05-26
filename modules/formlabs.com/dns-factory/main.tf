# locals {
#   dns_managed_zone = try(google_dns_managed_zone.dns-managed-zone[0], data.google_dns_managed_zone.dns-managed-zone[0])
# }

# /******************************************
# 	Create Domain
#  *****************************************/
# resource "google_dns_managed_zone" "dns-managed-zone" {
#   count = var.fqdn != "" ? 1 : 0
#   project = var.project_id
#   name     = var.name
#   dns_name = var.fqdn
#   visibility = var.public ? "public" : "private"

#  private_visibility_config {
#     networks {
#       network_url = "https://www.googleapis.com/compute/v1/projects/formlabs-377008/global/networks/default"
#     }
#   }
# }

# data "google_dns_managed_zone" "dns-managed-zone" {
#   count = var.fqdn != "" ? 0 : 1
#   name = var.name
# }

# /******************************************
# 	Create A records
#  *****************************************/
# resource "google_dns_record_set" "dns-record-set" {
#   for_each = var.records
#   project = var.project_id
# # Required
#   managed_zone = local.dns_managed_zone.name
#   name         = each.value.name != "" ? "${each.value.name}.${local.dns_managed_zone.dns_name}" : "${local.dns_managed_zone.dns_name}"
#   type         = each.value.type
#   rrdatas      = each.value.rrdatas

#   # Optionnal
#   ttl = each.value.ttl
# }

# /******************************************
# 	Create Cname records
#  *****************************************/
# resource "google_dns_record_set" "cname" {
#   name         = "test.${local.dns_managed_zone.dns_name}"
#   for_each = var.cnamerecords
#   project = var.project_id
#   # Required
#   managed_zone   = local.dns_managed_zone.name
#   type           = each.value.type_1
#   rrdatas        = each.value.rrdatas_1

#   # Optionnal
#   ttl   = each.value.ttl_1
# }

# locals {
#   dns-private-zone = try(google_dns_managed_zone.dns-private-zone[0], data.google_dns_managed_zone.dns-private-zone[0])
# }

module "dns-private-zone" {
  source  = "terraform-google-modules/cloud-dns/google"
  version = ">= 4.2.1"
  project_id = "formlabs-377008"
  type       = "private"
  region = "us-central1"
  name       = "private-dns-cloud"
  domain     = "prash.cloud."
#   for_each = var.cnamerecords
#   records      = local.records
#   cnamerecords = local.cnamerecords

  private_visibility_config_networks = [
      "https://www.googleapis.com/compute/v1/projects/formlabs-377008/global/networks/default"

  ]

   recordsets = [
  {
      name    = "formlabs-test"
      type    = "A"
      records = ["10.0.1.2"]
      ttl     = 60
    },
  {
    name = "cnamerecords"
      type    = "CNAME"
      records = ["rds-magento2-production-formlabs-cloud-encrypted.cchlcddjm6zo.us-east-1.rds.amazonaws.com.prash.cloud."]
      ttl     = 300
    }
  ]
  }

