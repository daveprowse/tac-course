provider "aws" {
  region = "us-east-2"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

module "webserver-dave" {
  source     = "../modules/webserver"
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/16"
  ami        = "ami-0c7c4e3c6b4941f0f"
  # Remember, select an AMI that exists in your AWS region.
  # If in doubt, use the AMI above and the us-east-2 region.
  instance_type  = "t2.micro"
  webserver_name = "Dave's"
}
