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

## Build an IAM user account resource here with a for_each meta-argument referecing a locals block.



## Then build a locals block with a toset function listing 4 users.



## Finally, build a locals block with common tags and reference it from the IAM user resource.



## More information on Locals: https://developer.hashicorp.com/terraform/language/values/locals


