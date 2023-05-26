/**
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

## Common ##

variable "project_id" {
  type        = string
  description = "The project to run tests against"
  default     = ""
}

variable "pg_ha_name" {
  type        = string
  description = "The name for Cloud SQL instance"
  default     = ""
}

variable "random_instance_name" {
  type        = bool
  description = "Sets random suffix at the end of the Cloud SQL resource name"
  default     = false
}

// required
variable "database_version" {
  description = "(Required) The MySQL, PostgreSQL or SQL Server (beta) version to use."
  type        = string
  default = "MYSQL_8_0"

  validation {
    condition     = contains(["MYSQL_5_6", "MYSQL_5_7", "MYSQL_8_0", "POSTGRES_9_6", "POSTGRES_10", "POSTGRES_11", "POSTGRES_12", "POSTGRES_13"], var.database_version)
    error_message = "The value must only be one of these valid values: MYSQL_5_6, MYSQL_5_7, MYSQL_8_0, POSTGRES_9_6, POSTGRES_10, POSTGRES_11, POSTGRES_12, POSTGRES_13."
  }
}

variable "region" {
  type        = string
  description = "The region of the Cloud SQL resources"
  default     = "us-central1"
}

## Master Configurations

variable "tier" {
  type        = string
  description = "The project to run tests against"
  default     = ""
}

variable "zone" {
  type        = string
  description = "The project to run tests against"
  default     = ""
}

variable "availability_type" {
  type        = string
  description = "The project to run tests against"
  default     = ""
}

variable "maintenance_window_day" {
  type        = string
  description = "The project to run tests against"
  default     = ""
}

variable "maintenance_window_hour" {
  type        = string
  description = "The project to run tests against"
  default     = ""
}

variable "maintenance_window_update_track" {
  type        = string
  description = "The project to run tests against"
  default     = ""
}

variable "deletion_protection" {
  type        = string
  description = "The project to run tests against"
  default     = ""
}

variable "db_charset" {
  type        = string
  description = "The name for Cloud SQL db char set"
  default     = ""
}

variable "db_collation" {
  type        = string
  description = "The name for Cloud SQL instance db collection value"
  default     = ""
}

variable "user_name" {
  type        = string
  description = "The name for Cloud SQL user name"
  default     = ""
}

variable "user_password" {
  type        = string
  description = "The name for Cloud SQL user name password"
  default     = ""
}

variable "ip_configuration" {
  description = "The ip configuration for the master instances."
  type = object({
    authorized_networks = list(map(string))
    ipv4_enabled        = bool
    private_network     = string
    require_ssl         = bool
    allocated_ip_range  = string
  })
  default = {
    authorized_networks = []
    ipv4_enabled        = true
    private_network     = null
    require_ssl         = null
    allocated_ip_range  = null
  }
}

variable "backup_configuration" {
  description = "The backup_configuration settings subblock for the database setings"
  type = object({
    enabled                        = bool
    start_time                     = string
    location                       = string
    point_in_time_recovery_enabled = bool
    transaction_log_retention_days = string
    retained_backups               = number
    retention_unit                 = string
  })
}

# variable "database_flags" {
#   description = "The database flags for the master instance. See [more details](https://cloud.google.com/sql/docs/postgres/flags)"
#   type = list(object({
#     name  = string
#     value = string
#   }))
#   default = [
#       { name = "log_checkpoints", value = "on" },
#       { name = "log_error_verbosity", value = "default" },
#       { name = "log_connections", value = "on" },
#       { name = "log_disconnections", value = "on" },
#       { name = "log_duration", value = "on" },
#       { name = "log_lock_waits", value = "on" },
#       { name = "log_statement", value = "all" },
#       { name = "log_hostname", value = "on" },
#       { name = "log_parser_stats", value = "off" },
#       { name = "log_planner_stats", value = "off" },
#       { name = "log_executor_stats", value = "off" },
#       { name = "log_statement_stats", value = "off" },
#       { name = "log_min_messages", value = "log" },
#       { name = "log_min_error_statement", value = "error" },
#       { name = "log_temp_files", value = "0" },
#       { name = "log_min_duration_statement", value = "-1" }
#     ]
# }

variable "database_flags" {
  description = "The database flags for the master instance. See [more details](https://cloud.google.com/sql/docs/postgres/flags)"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}




variable "user_labels" {
  description = "The key/value labels for the master instances."
  type        = map(string)
  default     = {}
}


/*
variable "pg_ha_external_ip_range" {
  type        = string
  description = "The ip range to allow connecting from/to Cloud SQL"
}
*/

// Read Replica Configurations

variable "read_replicas" {
  description = "List of read replicas to create. Encryption key is required for replica in different region. For replica in same region as master set encryption_key_name = null"
  type = list(object({
    name                  = string
    tier                  = string
    zone                  = string
    disk_type             = string
    disk_autoresize       = bool
    disk_autoresize_limit = number
    disk_size             = string
    user_labels           = map(string)
    database_flags = list(object({
      name  = string
      value = string
    }))
    ip_configuration = object({
      authorized_networks = list(map(string))
      ipv4_enabled        = bool
      private_network     = string
      require_ssl         = bool
      allocated_ip_range  = string
    })
    encryption_key_name = string
  }))
  default = [{
    name                  = ""
    tier                  = ""
    zone                  = ""
    disk_type             = ""
    disk_autoresize       = null
    disk_autoresize_limit = null
    disk_size             = ""
    # user_labels = {
    #   env                    = "aexp-app-env"
    #   data-classification    = "aexp-data-classification"
    #   carid                  = "aexp-app-carid"
    #   name                   = "aexp-app-name"
    #   tier                   = "aexp-app-tier"
    #   ops-supportgroup       = "aexp-ops-supportgroup"
    #   app-supportgroup       = "aexp-app-supportgroup"
    #   lifecycle-changenumber = "aexp-lifecycle-changenumber"
    # }
    user_labels = {
  foo = "bar"
}
    
    # database_flags = [
    #   { name = "log_checkpoints", value = "on" },
    #   { name = "log_error_verbosity", value = "default" },
    #   { name = "log_connections", value = "on" },
    #   { name = "log_disconnections", value = "on" },
    #   { name = "log_duration", value = "on" },
    #   { name = "log_lock_waits", value = "on" },
    #   { name = "log_statement", value = "all" },
    #   { name = "log_hostname", value = "on" },
    #   { name = "log_parser_stats", value = "off" },
    #   { name = "log_planner_stats", value = "off" },
    #   { name = "log_executor_stats", value = "off" },
    #   { name = "log_statement_stats", value = "off" },
    #   { name = "log_min_messages", value = "log" },
    #   { name = "log_min_error_statement", value = "error" },
    #   { name = "log_temp_files", value = "0" },
    #   { name = "log_min_duration_statement", value = "-1" }
    # ]
    database_flags = [
  { name = "autovacuum", value = "off" }
]

    ip_configuration = {
      ipv4_enabled       = true
      require_ssl        = true
      private_network    = null
      allocated_ip_range = null
      authorized_networks = [
        {
          name  = ""
          value = ""
        },
      ]
    }
    encryption_key_name = ""
    }
  ]
}

variable "additional_databases" {
  description = "A list of databases to be created in your cluster"
  type = list(object({
    name      = string
    charset   = string
    collation = string
  }))
  default = []
}

variable "additional_users" {
  description = "A list of users to be created in your cluster"
  type = list(object({
    name     = string
    password = string
  }))
  default = []
}