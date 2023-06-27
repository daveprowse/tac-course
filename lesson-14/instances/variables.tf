# Instance Variables

variable "instance_type" {
  description = "AWS EC2 Instance Type"
  default = "t2.micro"
}

variable "ssh_key" {
  description = "SSH Key for Instances and Virtual Machines"
  default = "ssh_key"
}

# Account Variables

variable "accounts" {
  description = "IAM users on AWS"
  default = ["Alice", "Bob", "Charlie", "Denise", "Erin", "Frank", "Darth" ]
}