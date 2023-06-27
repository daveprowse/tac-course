## This lab is already complete. You don't need to do anything other than `terraform init` and `terraform apply`.
## Review the dynamic block code and how it interacts with the locals block.
## > Note that labs such as these will require a default VPC and subnet (as usual).

resource "aws_instance" "dynamic_ports" {
  ami           = "ami-0c7c4e3c6b4941f0f"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.sg_webserver.id]
  
  tags = {
    Name = "Dynamic-Ports-Lab"
  }
}

locals {
  inbound_ports = [80, 443]
  outbound_ports = [443, 1433]
}

resource "aws_security_group" "sg_webserver" {
  name = "webserver-sg"
  description = "Security Group for Web Servers"
  
  ## Here we use dynamic blocks to call information from a locals block. These dynamic blocks can be reused as we see fit in other resources.

  dynamic "ingress" {
    for_each = local.inbound_ports
    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = local.outbound_ports
    content {
      from_port = egress.value
      to_port = egress.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

## For more about dynamic blocks see: https://developer.hashicorp.com/terraform/language/expressions/dynamic-blocks