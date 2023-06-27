terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.01"
    }
  }

  required_version = ">= 1.4.6"
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "workspace_testing" {
  ami           = "ami-0c7c4e3c6b4941f0f"
  instance_type = var.instance_type

  tags = {
    Name = var.name
  }
}