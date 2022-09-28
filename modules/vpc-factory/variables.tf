variable "project_id" {
  type        = string
  description = "The ID of a project to host this VPC"
}

variable "network_name" {
  type        = string
  description = "The name of the network being created"
}

variable "subnets" {
  type        = list(map(string))
  description = "The network routing mode"
}

variable "firewall_rules" {
  type        = any
  description = "List of firewall rules"
  default     = []
}

variable "shared_vpc_host" {
  type        = bool
  description = "Makes this project a Shared VPC host"
  default     = false
}
