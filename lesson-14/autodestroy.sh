#!/bin/bash

start=$SECONDS
terraform -chdir=instances destroy -auto-approve

terraform -chdir=bucket destroy -auto-approve

printf "\n\033[7;32mPROCESS COMPLETE! \033[0m"
printf "\nTime to complete = %s seconds" "$SECONDS"
echo

# If you have issues with this script, remember to destroy both Terraform configurations. 
# That means go to the buckets directory and run a `terraform destroy`
# And go to the instances directory and again, run a `terraform destroy`
# !!! CHECK THAT ALL INSTANCES, USERS, and BUCKETS have been DESTROYED at the AWS CONSOLE !!!