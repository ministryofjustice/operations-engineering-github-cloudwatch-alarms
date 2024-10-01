terraform {
  required_version = ">= 1.3.0"
  backend "s3" {
    acl     = "private"
    bucket  = "operations-engineering-test-terraform-state-bucket"
    encrypt = true
    key     = "terraform/dsd/cloudwatch_alarms/terraform.tfstate"
    region  = "eu-west-2"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.73.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}