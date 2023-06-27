# Example of multiple AWS regions in one .tf file.

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

## The first provider is shown in the normal manner.
provider "aws" {
  region = "us-east-2"
}

## The second provider uses an alias. "oregon" is the alias for "us-west-2"
provider "aws" {
  alias = "oregon"
  region = "us-west-2"
}

## Create an instance the way you normally would in the us-east-2 region. 
## This will be Debian Linux running in Ohio (us-east-2).

resource "aws_instance" "test_instance" {
  ami           = "ami-0c7c4e3c6b4941f0f"
  instance_type = "t2.micro"
  tags = {
    Name = "OHIO TEST INSTANCE! DESTROY ME WHEN DONE!!"
  }
}

## Later, resources can be created in the second region by  
## using the alias: aws.oregon
## This will be Debian Linux running in Oregon (us-west-2). Note the different ami for the region (free tier eligible)

resource "aws_instance" "oregon_instance" {
  provider = aws.oregon
  ami           = "ami-0744bdf45532dfd8e"
  instance_type = "t2.micro"
  tags = {
    Name = "OREGON TEST INSTANCE! DESTROY ME WHEN DONE!!"
  }
}