terraform {
  required_version = ">= 1.3.0"
}

resource "aws_subnet" "web_subnet" {
  vpc_id = var.vpc_id
  cidr_block = var.cidr_block
}

resource "aws_instance" "webserver" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.webserver.id

  tags = {
    Name = "${var.webserver_name} webserver"
  }
}
