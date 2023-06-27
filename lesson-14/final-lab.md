# Final Terraform Lab: Terraform with AWS, Ansible, and Bash
This lab does the following:
- Creates an AWS S3 bucket (to act as the backend for our state files)
- Creates two Ubuntu VMs on AWS
- Uses Cloud-init to setup a new user and prepare the VMS. 
- Runs an Ansible playbook that installs an nginx web server to both VMs..
- Sets up a basic website for fun!
  
> Note: This lab is meant for demonstration purposes. In the field, I would organize it differently, add variables (many), and increase security to the Nth degree.

> Note: There are a **lot** of moving parts in this lab, and therefore a lot can go wrong. Be ready to troubleshoot! If you need to, contact me at my website (https://prowse.tech) or at my Discord server: (https://discord.com/invite/mggw8VGzUp).

## !!! IMPORTANT !!!

> The entire run is done within a bash script named automagic.sh. Be sure to analyze script files before running them!

> There is no solution directory. The entire lab is the solution.

> You will need to have Ansible installed on your system. More on that later in the lab.

## Analyze the Bash scripts and set permissions
- First, locate the automagic.sh and autodestroy.sh scripts and analyze them. 
  
> Remember: Be sure you understand what the scripts will do before executing them.
  
- Set the scripts' permissions to execute.
  
  `chmod +x {automagic.sh,autodestroy.sh}`

## Analyze the bucket, instances, and scripts directories
The entire process consists of two Terraform configurations:
- S3 bucket creation
- AWS infrastructure creation (instances and IAM users)
  
The first Terraform configuration creates the S3 bucket.
The bucket directory contains code for Terraform to create the bucket. This is then used by the second Terraform configuration as a backend for the state file.

You will see that the instances directory has a lot of .tf files. Analyze these and understand what each of them does. Essentially, this is where we have our AWS instances, security groups, and IAM users. The state file for this configuration will be stored within the previously created S3 bucket.

> Note: If you decide to change the AWS region(s), make sure that you utilize an Ubuntu AMI that exists in that region. Take note that this lab uses two AWS regions incorporating an alias.

The scripts directory contains a cloud-init script that will create a new user and run a couple of basic commands on the instances once they are created.

## Analyze the Ansible information
> Important! Ansible must be installed on your local system. See the following link for your distro: https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html#installing-ansible-on-specific-operating-systems

> You will need to have the ansible command set up within your PATH and your user will need to be able to run Ansible commands. That user account should also have administrative permissions (sudo or wheel).

Take a look at the files inside the Ansible directory.
- ansible.cfg is the main Ansible configuration file. It is called on by automagic.sh by exporting the config variable. It relies on the "hulk" account that was created by the cloud-init script.
- The inventory file is blank. This will be written to by the script, making use of the `terraform output` command (with options).
- The playbook is pretty simple. It installs nginx to the hosts, clones a git repository, and copies the file to the webserver so that the game will work. Feel free to modify the playbook as you see fit!

## Create SSH keys
- Go to the keys directory and build yourself an SSH key to use for this lab. I recommend using ed25519 and naming the key "ssh_key" so that it works with the lab properly.
> Note: If you plan to use the optional Azure VM, you will need to use RSA-based SSH keys.
- Paste the public key into two places:
  - key_deployer.tf: AWS key deployer
  - scripts/hulk.yaml
> Note: If you change the name of the key, then specify that name in key_deployer.tf, variables.tf, main.tf, ansible.cfg, and in automagic.sh

## Choose a Bucket Name and Bucket Key Name
Decide on a unique bucket name. Then, type it in to the following places:
- bucket/main.tf in the module.s3_bucket.bucket argument.
- instances/version.tf in the "bucket" argument

Decide on a key name and place it in the "key" argrument. For example: "dir1/terraform.tfstate"

## Execute the Terraform run
- Be sure that you are working in the "Lesson-14" directory in the terminal.
- Execute the automagic script.
  
  `./automagic.sh`
  
- Watch the magic sauce do its thing.

## Analyze what happened
- Review what occurred in the terminal including the Terraform information and the Ansible information.
- View the instances in the AWS console.
  > Note: Check both regions!
- View the IAM users in the AWS console.
- View the state file in the S3 bucket
- Attempt to connect to the webserver in your browser. (Use http)
- Attempt to SSH into one of the instances and view the running nginx service. This will be similar to the following:
  
  - `ssh -i "keys/ssh_key" hulk@<ipaddress>`

  > Note: Run a `terraform -chdir=instances output` to output the IP addresses if need be.

  - `systemctl status nginx`

Do whatever other analysis you want!

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

From the lesson-14 directory, use the autodestroy.sh script to destroy the infrastructure. If for some reason that does not work, use the `terraform destroy` command for both the instances/ and the bucket/ directories (in that order):

`terraform -chdir=instances destroy`

`terraform -chdir=bucket destroy`

Be sure that all infrastructure is terminated in the AWS console! This includes:
- 2 instances
- 7 users
- 1 bucket

**!!! BE POSITIVE THAT ALL RESOURCES HAVE BEEN DESTROYED !!!**

---
## *Excellent ^ That was the last lab (or was it?). Great work!*
---