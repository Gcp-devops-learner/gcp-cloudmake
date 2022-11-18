terraform {
  required_version = "1.3.5"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.43"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 4.43"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.40"
    }
  }
}
