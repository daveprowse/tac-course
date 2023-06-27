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

# Watch for an error in here! TROUBLESHOOT!
resource "aws_iam_user" "user_1" {
  name = User-1
  tags = {
    Troubleshooting = "YES"
  }
}

