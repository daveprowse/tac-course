variable "vpc_id" {
  type = string
  description = "VPC ID"
}

variable "cidr_block" {
  type = string
  description = "CIDR BLOCK"
}

variable "ami" {
  type = string
  description = "AMI for the webserver instance"
  # Pick an AMI that exists within your region and is free tier eligible
}

variable "instance_type" {
  type = string
  description = "Instance type"
  # Go with t2.micro for free tier eligible AMIs
}

variable "webserver_name" {
  type = string
  description = "Name of the webserver"
}