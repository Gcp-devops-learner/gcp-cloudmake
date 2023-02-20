locals {
  all_folder_admins = [
    "group:gcp-security-admins@formlabs.com",
    "group:gcp-devops@formlabs.com",
  ]

  org_folders = [
    {
      business_unit = "Common"
    },
    {
      business_unit = "GnA"
      teams = [
        {
          name = "BusinessSystems"
          environments = [
            {
              name = "Dev"
            },
            {
              name = "Prod"
            },
          ]
        },
        {
          name = "DevOps"
          environments = [
            {
              name = "Dev"
            },
            {
              name = "Prod"
            },
          ]
        },
        {
          name = "Data"
          environments = [
            {
              name = "Dev"
            },
            {
              name = "Prod"
            },
          ]
        },
        {
          name = "TOps"
          environments = [
            {
              name = "Dev"
            },
            {
              name = "Prod"
            },
          ]
        },
        {
          name = "Security"
          environments = [
            {
              name = "Dev"
            },
            {
              name = "Prod"
            },
          ]
        },
        {
          name = "Finance"
          environments = [
            {
              name = "Dev"
            },
            {
              name = "Prod"
            },
          ]
        },
        {
          name = "PeopleOps"
          environments = [
            {
              name = "Dev"
            },
            {
              name = "Prod"
            },
          ]
        },
      ]
    },
    {
      business_unit = "RnD"
      teams = [
        {
          name = "Preform"
          environments = [
            {
              name = "Dev"
            },
            {
              name = "Prod"
            },
          ]
        },
        {
          name = "FleetControl"
          environments = [
            {
              name = "Dev"
            },
            {
              name = "Prod"
            },
          ]
        },
        {
          name = "Embedded"
          environments = [
            {
              name = "Dev"
            },
            {
              name = "Prod"
            },
          ]
        },
        {
          name = "Factory"
          environments = [
            {
              name = "Dev"
            },
            {
              name = "Prod"
            },
          ]
        },
        {
          name = "Materials"
          environments = [
            {
              name = "Dev"
            },
            {
              name = "Prod"
            },
          ]
        },
      ]
    },
    {
      business_unit = "SnM"
      teams = [
        {
          name = "Web"
          environments = [
            {
              name = "Dev"
            },
            {
              name = "Prod"
            },
          ]
        },
        {
          name = "Services"
          environments = [
            {
              name = "Dev"
            },
            {
              name = "Prod"
            },
          ]
        },
      ]
    },
  ]
}
