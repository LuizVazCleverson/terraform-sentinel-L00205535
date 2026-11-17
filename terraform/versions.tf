terraform {
  required_version = ">= 1.6.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  cloud {
    organization = "atu-devops-L00205535"

    workspaces {
      name = "terraform-sentinel-L00205535"
    }
  }
}
