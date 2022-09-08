terraform {
  required_version = "1.2.8"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.34"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 4.34"
    }
  }
}
