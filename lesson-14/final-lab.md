# Lab 10 - Terraform with AWS, Ansible, and Bash
This lab does the following:
- Creates two Ubuntu VMs on AWS
- Uses Cloud-init to setup a new user and prepare the VMS. 
- Runs an Ansible playbook that installs an nginx web server to both VMs..
  
> Note: This lab is meant for demonstration purposes. In the field, I would organize it differently, add variables (many), and increase security to the Nth degree.

## !!! IMPORTANT !!!

> Ansible must be installed on your local system. See the following link for your distro: https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html#installing-ansible-on-specific-operating-systems

> The entire run is done within a bash script named automagic.sh. Be sure to analyze script files before running them!

> There is no solution directory. The entire lab is the solution.

## Create SSH keys
- Go to the keys directory and build yourself an SSH key to use for this lab. I recommend using ed25519 and naming the key "aws_key" so that it works with the lab properly.
- Paste the public key into two places:
  - main.tf AWS key deployer
  - scripts/hulk.yaml
> Note: This is similar to Lab 05.
- If you change the name of the key, then specify that name in main.tf and in automagic.sh

## Analyze the instances and scripts directories
This is a similar setup to Lab 05. However, it will create two separate instances. 

> Note: If you decide to change the AWS region, make sure that you utilize an Ubuntu AMI that exists in that region.

## Analyze the Ansible information
Take a look at the files inside the Ansible directory.
- ansible.cfg is the main Ansible configuration file. It is called on by automagic.sh by exporting the config variable. It relies on the "hulk" account that was created by the cloud-init script.
- the inventory file is blank. This will be written to by the script, making use of the terraform output command.
- The playbook simply installs nginx to the hosts. Feel free to modify the playbook as you see fit!

## Analyze the scripts and set permissions
- First, locate the automagic.sh and autodestroy.sh scripts and analyze them. 
  
> Remember: Be sure you understand what the scripts will do before executing them.
  
- Set the scripts' permissions to execute.
  
  `chmod +x {automagic.sh,autodestroy.sh}`

## Execute the Terraform run
- Work in the lab-10 directory in the terminal.
- Execute the automagic script.
  
  `./automagic.sh`
  
- Watch the magic sauce do its thing.

## Analyze what happened
- Review what occurred in the terminal including the Terraform information and the Ansible information.
- View the instances in the AWS console.
- View the state file in the instances directory.
- Attempt to connect to the webserver in your browser.
- Attempt to SSH into one of the instances and view the running nginx service. This will be similar to the following:
  
  - `ssh -i "keys/aws_key" hulk@<ipaddress>`
  
  - `systemctl status nginx`

## Graph it!
Use the terraform graph command to create a digraph and visualize it in a browser. 

- First, go to the instances directory and run the following command:

`terraform graph >> graph1`

That should create the digraph file. Take a look at it.

- Next, view the digraph info as a visual graph in a browser. There are several options for this. For example:
  - Copy and paste the data to http://webgraphviz.com
  - Run it manually by installing graphviz, utilizing the dot command, and opening it in your favorite browser:
    
    `sudo apt install graphviz`  (most likely already installed)
    
    `dot -Tsvg graph1 > output.svg`
    
    `firefox output.svg`

That should display dependency graph of your resources in Terraform. Fun!

## Destroy the infrastructure
Once again, it's very important to destroy the infrastructure so that you are not billed any more than need be.

From the lab-10 directory, use the autodestroy.sh script to destroy the infrastructure. If for some reason that does not work, go to the instances directory and type:

`terraform destroy`

Be sure that all infrastructure is terminated in the AWS console!
    
---
## *Excellent ^ That was the last lab (or was it?). Great work!*
---