## Setup network infrastructure so that two instances can ping each other internally and show results!

locals {
  inbound_ports = [22, 80, 443]
  outbound_ports = [22, 80, 443, 1433]
}

resource "aws_security_group" "sg_webserver_ohio" {
  name = "webserver-sg-ohio"
  description = "Security Group Ports for Web Servers"

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

resource "aws_security_group" "sg_webserver_virginia" {
  provider = aws.virginia
  name = "webserver-sg-virgina"
  description = "Security Group Ports for Web Servers"

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