terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 4.50"
        }
    }

    required_version = ">= 1.4.0"
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "lesson_04" {
  ami           = "ami-071226ecf16aa7d96"
  instance_type = "t2.micro"
    
  # Security group resources
  vpc_security_group_ids = [
    # referring to security groups created below
    # sg_ssh and sg_https
    aws_security_group.sg_ssh.id,
    aws_security_group.sg_https.id
  ]

  tags = {
    Name      = "Lesson-04-VM-SG"
  }
}

resource "aws_security_group" "sg_ssh" {
  ingress {  # Inbound SSH rule
    # any IP address (0.0.0.0/0) can access SSH port 22 to this instance
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"  # connection oriented protocol
    from_port   = 22  # default SSH port
    to_port     = 22
  }

  egress {  # Outbound rule for all traffic
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"  # -1 means protocols can be connected to anywhere (0.0.0.0/0)
    from_port   = 0
    to_port     = 0
  }
}

resource "aws_security_group" "sg_https" {
  ingress {
    cidr_blocks = ["192.168.0.0/16"]  # allow only specific networks to access this instance
    protocol    = "tcp"
    from_port   = 443  # only HTTPS port 443 connection allowed
    to_port     = 443
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
  }
}