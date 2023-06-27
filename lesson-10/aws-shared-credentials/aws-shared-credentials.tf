# More information on shared credentials in AWS:
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs#shared-configuration-and-credentials-files

terraform {
  required_version = ">= 1.2.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  } 
}

provider "aws" {
  region = "us-east-2"
  shared_credentials_files = ["/home/user/.aws/credentials"]
	profile = "prod"
  
  # > Note: Often, team members will collaborate using a shared user account (such as tf_user)
  # > If that is the case, then the path would be "/home/tf_user/.aws/credentials"
  # > You could also share the config file with the shared_config_files argument.

}

resource "aws_iam_user" "test_user" {
  name = "test-user" 
  tags = {
    department = "OPS"
  }
}

