##################################
## TEST FILE FOR USER CREATION ###
##################################

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.40"
    }
  }

  required_version = ">= 1.4.6"
}

provider "aws" {
  region = "us-east-2"  
}

resource "aws_iam_user" "test_user" {
  name = "user-${count.index}" 
  count = 3
  tags = {
    time_created = timestamp()    
    department = "OPS"
  }
}



# This outputs the name of all users created
output "Name_of_all_users" {
  value = aws_iam_user.test_user[*].name
}

# # This outputs the name of the first user
# output "Name_of_the_first_user" {
#   value = aws_iam_user.test_user[0].name
# }

# #This outputs all element information about the second user
# output "All_info_about_the_element_0" {
#   value = element(aws_iam_user.test_user, 1)
# }

