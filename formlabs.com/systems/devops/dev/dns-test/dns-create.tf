module "dns-private-zone" {
  source       ="../../../../../modules/formlabs.com/dns-factory/"
  project_id   = local.project_id
  region       = local.region
  name         = local.name
  fqdn         = local.fqdn
  records      = local.records
  cnamerecords = local.cnamerecords
}