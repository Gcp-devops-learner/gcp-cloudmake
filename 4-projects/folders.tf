locals {
  business_unit_teams = { for bu in local.org_folders : bu.business_unit => bu if lookup(bu, "teams", null) != null }
  teams_envs          = flatten([for bu, v in local.business_unit_teams : [for team in v.teams : { business_unit = bu, team = team.name, envs = team.environments } if lookup(team, "environments", null) != null]])
}

module "business_unit_folders" {
  source  = "terraform-google-modules/folders/google"
  version = "~> 3.1"

  parent            = "organizations/${local.org_ids["formlabs_com"]}"
  names             = local.org_folders[*].business_unit
  set_roles         = true
  all_folder_admins = local.all_folder_admins
}

module "team_folders" {
  source  = "terraform-google-modules/folders/google"
  version = "~> 3.1"

  for_each          = local.business_unit_teams
  parent            = module.business_unit_folders.ids_list[index(module.business_unit_folders.names_list, each.key)]
  names             = each.value.teams[*].name
  set_roles         = true
  all_folder_admins = local.all_folder_admins
}

module "env_folders" {
  source  = "terraform-google-modules/folders/google"
  version = "~> 3.1"

  count = length(local.teams_envs)
  parent = module.team_folders[local.teams_envs[count.index].business_unit].ids_list[
    index(module.team_folders[local.teams_envs[count.index].business_unit].names_list, local.teams_envs[count.index].team)
  ]
  names             = local.teams_envs[count.index].envs[*].name
  set_roles         = true
  per_folder_admins = { for e in local.teams_envs[count.index].envs : e.name => e.admin if lookup(e, "admin", null) != null }
  all_folder_admins = local.all_folder_admins
}
