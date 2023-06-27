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

## Add an IAM user resource here using a for_each meta-argument with a toset function.
## Include four users in the set. Remember to use this syntax ([]) for the toset function.




#----------------------------------#
# More information about for_each: https://developer.hashicorp.com/terraform/language/meta-arguments/for_each
# More information about toset: https://developer.hashicorp.com/terraform/language/functions/toset
#----------------------------------#
