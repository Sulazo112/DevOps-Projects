terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Optional: remote state backend (S3), uncomment and configure if needed
  # backend "s3" {
  #   bucket = "your-tf-state-bucket"
  #   key    = "terraform-ec2-apache/terraform.tfstate"
  #   region = "eu-west-1"
  # }
}

provider "aws" {
  region = var.aws_region
}

