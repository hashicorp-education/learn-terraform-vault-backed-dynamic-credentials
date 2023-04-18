terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.62.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "~> 3.14.0"
    }
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.43.0"
    }
  }
}
