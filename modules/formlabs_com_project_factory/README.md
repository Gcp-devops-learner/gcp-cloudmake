<!-- BEGIN_TF_DOCS -->
# GCP Project Factory for Formlabs.com acccount

#### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gcp_project"></a> [gcp\_project](#module\_gcp\_project) | terraform-google-modules/project-factory/google | ~> 13.0 |

#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_activate_api_identities"></a> [activate\_api\_identities](#input\_activate\_api\_identities) | The list of service identitie to force-create for the project | <pre>list(object({<br>    api   = string<br>    roles = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_activate_apis"></a> [activate\_apis](#input\_activate\_apis) | The list of apis to activate within the project | `list(string)` | `[]` | no |
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The ID of the billing account to associate this project with. Default is Formlabs SADA | `string` | `""` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | The ID of a folder to host this project | `string` | `""` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | The list of labels that assign with the project | `map(string)` | `{}` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The name of the project | `string` | n/a | yes |
<!-- END_TF_DOCS -->