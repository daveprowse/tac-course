terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "lesson_03" {
  ami           = "ami-071226ecf16aa7d96"
  instance_type = "t2.micro"

  tags = {
    Name = "Lesson-03-AWS-Instance"
  }
}
