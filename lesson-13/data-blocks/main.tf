## This lab is already complete. You don't need to do anything other than `terraform init` and `terraform apply`.
## Review the data source block code and how it is called from the resource block.

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

data "aws_ami" "ubuntu" {
  most_recent = true
  owners = ["543428934710"] # Canonical
}

resource "aws_instance" "data_block_instance" {
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
}

### NOTES
## The data block uses "owners". You can find out the owner ID of AMIs by going to the AWS console,
## choose AMIs, and in the filter, select Public Images. Click the Search and granulate as necessary. 

## More information on data sources: https://developer.hashicorp.com/terraform/language/data-sources 
## MOre information on data source: aws_ami: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami


