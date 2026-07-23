terraform {
  cloud {
    organization = "tfe_demo"

    workspaces {
      name = "TFE_demo"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}