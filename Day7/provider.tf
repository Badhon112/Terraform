terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  #   backend "s3" {
  #     region         = "*******"
  #     bucket         = "**********"
  #     dynamodb_table = "********"
  #     key            = "********"
  #   }
}

provider "aws" {
  region = "ap-south-1"
}
