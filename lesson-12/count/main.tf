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
  region = "us-east-2"
}

resource "aws_instance" "count_lab" {
  # add your count meta-argument here!
  ami           = "ami-0c7c4e3c6b4941f0f"
  instance_type = "t2.micro"
    
  tags = {
    # Modify the Name tag so that it uses the count_index argument!
    Name = "Count-Lab"
  }
}