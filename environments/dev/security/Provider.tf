terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = "<= 1.5.6"
}

# Configure the AWS Provider
provider "aws" {
  region  = "us-east-1"
  profile = "sandbox-user"
}