terraform {
  required_version = "1.3.6"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.46"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 4.46"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.46"
    }
  }
}
