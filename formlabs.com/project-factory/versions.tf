terraform {
  required_version = "1.2.9"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.37"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 4.37"
    }
  }
}
