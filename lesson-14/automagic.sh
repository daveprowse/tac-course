#!/bin/bash

start=$SECONDS

terraform -chdir=instances init
terraform -chdir=instances apply -auto-approve

export ANSIBLE_CONFIG=ansible/ansible.cfg

: > ansible/inventory
echo "[nginx]" > ansible/inventory
echo $(terraform -chdir=instances output -raw public_ip_a) >> ansible/inventory
echo $(terraform -chdir=instances output -raw public_ip_b) >> ansible/inventory

sleep 3

echo
echo
 
printf "\n\033[7;31mWAITING 10 SECONDS FOR SYSTEM TO INITIALIZE - PING CHECK......\033[0m\n\n"
sleep 10

ansible all --private-key keys/aws_key -i ansible/inventory -u hulk -m ping

printf "\n\033[7;31mWAITING 10 SECONDS BEFORE RUNNING THE PLAYBOOK......\033[0m\n\n"
sleep 10

ansible-playbook ansible/playbook.yml --private-key keys/aws_key -i ansible/inventory -u hulk

printf "\n\033[7;32mAPPLY COMPLETE! \033[0m"
echo
printf "\nTime to complete = %s seconds" "$SECONDS"

## END
