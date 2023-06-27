# This is code that you can use to store the state file remotely in an S3 bucket.
# For this to work properly, wou will need to create your own unique bucket on AWS 

terraform {
  backend "s3" {
    bucket = "dpro-bucket-backend"
    key    = "dir1/key"
    region = "us-east-2"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.40"
    }
  }

  required_version = ">= 1.4.6"
}

provider "aws" {
  region = "us-east-2"  
}

resource "aws_iam_user" "user_42" {
  name = "user-42" 
  tags = {
    department = "OPS"
  }
}