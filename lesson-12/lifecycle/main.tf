##################################
## TEST FILE FOR USER CREATION ###
##################################

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.01"
    }
  }

  required_version = ">= 1.4.6"
}

provider "aws" {
  region = "us-east-2"  
}

resource "aws_iam_user" "accounts_2" {
  for_each = toset(["Ernie", "Frank", "Gina", "Harry"])
  name = each.key

  # Add a lifecycle sub-block here with the prevent_destroy meta-argument set to true.
  # Apply the users, then attempt to destroy them and analyze the error.


}


#----------------------------------#
# More information about for_each: https://developer.hashicorp.com/terraform/language/meta-arguments/lifecycle
#----------------------------------#
