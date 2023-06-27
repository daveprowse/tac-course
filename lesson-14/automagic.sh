#!/bin/bash

## IMPORTANT! This lab is designed to run on a Linux system, or one with access to a Bash terminal. 
## Any other systems may encounter errors!
## You will need Ansible installed on the local system for the lab to work properly.

start=$SECONDS

terraform -chdir=bucket init
terraform -chdir=bucket apply -auto-approve

printf "\n\033[7;31mWAITING 5 SECONDS FOR BUCKET TO INITIALIZE......\033[0m\n\n"
sleep 5

printf "\n\033[7;31mS3 BUCKET CREATED!!!......\033[0m\n\n"

terraform -chdir=instances init
terraform -chdir=instances apply -auto-approve

export ANSIBLE_CONFIG=ansible/ansible.cfg

: > ansible/inventory
echo "[nginx]" > ansible/inventory
echo $(terraform -chdir=instances output -raw public_ip_server_1) >> ansible/inventory
echo $(terraform -chdir=instances output -raw public_ip_server_2) >> ansible/inventory

sleep 3

echo
echo
 
printf "\n\033[7;31mWAITING 10 SECONDS FOR SYSTEMS TO INITIALIZE - PING CHECK......\033[0m\n\n"
sleep 10

ansible all --private-key keys/ssh_key -i ansible/inventory -u hulk -m ping

printf "\n\033[7;31mWAITING 10 SECONDS BEFORE RUNNING THE PLAYBOOK......\033[0m\n\n"
sleep 10

ansible-playbook ansible/playbook.yml --private-key keys/ssh_key -i ansible/inventory -u hulk

printf "\n\033[7;32mPROCESS COMPLETE! \033[0m"
echo
printf "\nTime to complete = %s seconds" "$SECONDS"
echo

## END
