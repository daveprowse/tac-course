################
## TEST FILE ###
################

# This works well for planning/testing, but applies are time consuming. 
# If you want to test with apply, use the test-users directory. That works with IAM users which apply almost instantaneously.
  
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

resource "aws_instance" "test_instance" {
  ami           = "ami-0c7c4e3c6b4941f0f"
  instance_type = "t2.micro"
  tags = {
    Name = "TEST INSTANCE! DESTROY ME WHEN DONE!!"
  }
}
