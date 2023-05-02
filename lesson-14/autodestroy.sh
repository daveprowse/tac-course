#!/bin/bash

start=$SECONDS
terraform -chdir=instances destroy -auto-approve

printf "\n\033[7;32mDESTROY COMPLETE! \033[0m"
printf "\nTime to complete = %s seconds" "$SECONDS"
