terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.44.0"
    }
  }
}

provider "aws" {
  profile = "harish.km@systems-plus.com"
  region  = "us-east-1"
}
