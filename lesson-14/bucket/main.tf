terraform {  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.01"
    }
  }
  required_version = ">= 1.4.6"
}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  version = "3.14.0"
  # Pick a name for your bucket and type it in the double-quotes. Add this to instances/version.tf as well
  bucket = ""
  acl    = "private"
  force_destroy = true

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}
