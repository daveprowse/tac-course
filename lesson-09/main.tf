terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.40"
    }
  }

  required_version = ">= 1.3.6"
}

provider "aws" {
  region = "us-east-2"  
}

resource "aws_iam_user" "user_1" {
  tags = {
    Name = User-1    
  }
}

