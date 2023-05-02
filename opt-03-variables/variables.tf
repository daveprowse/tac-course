variable "region" {
  description = "The AWS region you would like to use"
  type = string
  # For example, us-east-2
}

variable "ami" {
  description = "The Amazon machine image to be used"
  type = string
  # I recommend the Debian image we used previously
  # ami-0c7c4e3c6b4941f0f
}

variable "name" {
  description = "Name tag of the instance"
  type = string    
  # This will be the name that shows up on the AWS console and within tags
}

variable "category" {
  description = "The category for this instance"
  type = string
  # You can choose any category name you want: prod, dev, testing, etc...
}