<!-- BEGIN_TF_DOCS -->
# GCP VPC Factory
# Create VPC with given networks with access to the Internet

#### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-google-modules/network/google | ~> 5.2 |

#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_firewall_rules"></a> [firewall\_rules](#input\_firewall\_rules) | List of firewall rules | `any` | `[]` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | The name of the network being created | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of a project to host this VPC | `string` | n/a | yes |
| <a name="input_shared_vpc_host"></a> [shared\_vpc\_host](#input\_shared\_vpc\_host) | Makes this project a Shared VPC host | `bool` | `false` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | The network routing mode | `list(map(string))` | n/a | yes |
<!-- END_TF_DOCS -->