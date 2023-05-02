# AWS Configuration with SSH and Outputs
Here you will build on the previous lab by adding proper SSH support. You'll also learn how to use outputs to have Terraform tell you information you need to know, such as the IP address and name of an instance.

# Procedure
This lab is a bit more in-depth, so go slow, and take it step-by-step. This time we'll be using a current Ubuntu image. If you get stuck, view the solution in the /solution directory. 

## Create a directory structure
Create two new directories: instances and keys.
For example: `mkdir {instances,keys}`
- Your main.tf file will go into the instances directory. This is the directory where you will run your Terraform commands.
- Your SSH keys will be placed in the keys directory.

## Create an SSH key pair
You will need openssh or another SSH tool installed. 
- Run the command `ssh-keygen` to create an SSH key pair.

> NOTE: Consider using ED25519 instead of the default RSA. 
> For example: `ssh-keygen -t ed25519`

- Name the key "aws_key" and save the key to the "keys" directory. (You can also specify the path and key name with the `-f` option of the ssh-keygen command.)

> NOTE: The solution does not have a key pair, you will have to take care of that part!

## Build your Terraform files
- Make the following files within the instances directory:

  - version.tf
  - provider.tf
  - main.tf
  - outputs.tf

- In version.tf, use the standard terraform block code that you have used previously.
- In provider.tf, use the standard provider block code that you have used previously. Change the region to meet your geographical requirements.
- Copy the code from code-main.txt to your main.tf file. Analyze this file. Find the block named <resource "aws_key_pair"> and add your SSH public key where it says <public_key>
- Copy the code from code-outputs.txt to your outputs.tf file. Analyze this file. What information will Terraform supply you with when the terraform apply is complete? 
> IMPORTANT!! WATCH FOR ERRORS!!

## Initialize, validate, and apply your Terraform configuration
- Your working Terraform directory is /instances. 
- Use the commands you have learned to initialize, format, validate, plan, and finally, apply your configuration. 
- What information was outputted to you in the terminal?

> NOTE: If you lose the outputted information just type `terraform output` to see it again!

- Once the infrastructure has been built, view it within your AWS console.

## SSH into your new virtual machine.
Using the information that was outputted, SSH into your instance.

For example, you might do something similar to this:
`ssh -i "../keys/aws_key" ubuntu@<ip_address>`

> NOTE: If you were to look at the AWS console and view the SSH option, it would show "aws_key.pem" but the .pem extension will not work because we created a standard openssh key pair, not an AWS key pair.

Make sure that you can access the system. Run commands on the remote system such as:
`cat /etc/os-release`
and
`systemctl status apache2`
(The second command should result in an error because apache2 is not installed yet.)

When done, exit out of the SSH session.

## Destroy the infrastructure
Use the appropriate command to destroy the infrastructure. 

---
## *As always, great work!*
---