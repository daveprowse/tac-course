# AWS Configuration with Security Groups
In this lab you will once again create infrastructure on AWS, but in this lab you will include two security groups to allow access via SSH and HTTPS.
This time, the instructions will be less specific and you will be expected to run the proper commands. 
You will have 5 minutes.

## Write the code!
This time, you will be writing some of the code line by line so that you can get a feel for working with Terraform code. 

- Create a main.tf file for your code. 
- Write a terraform block and provider block similar to the ones we used in a previous lesson. 
- Copy and paste the code for the resource and security groups from the file named code.txt. This can be placed after your provider block.
- Save your work!

> NOTE: For additional practice, if you are using VSCode, consider opening code.txt in the built-in Terminal (using the cat command or vim/nano) and type the code, line by line, in the code window. 

> NOTE: For more information on all AWS instance types, see this link: https://aws.amazon.com/ec2/instance-types/

## Take a look at the Terraform Registry
https://registry.terraform.io/

Search for the AWS provider and then, in the documentation, search for "aws_security_group". 

## Validate and create your infrastructure
Initialize, format, and validate your code. Then, create the infrastructure. Use terraform commands from memory.

> NOTE: Use the help system and your notes if you get stuck! If you get super-stuck, view the main.tf file in the solution directory.

## Analyze the infrastructure within the AWS console and state file

- Verify that your instance was created.
- View the two security groups and their ports.
- View those security groups in the state file.

## Attempt to SSH into your new instance
You will not be able to do this. View the error that follows.

## Destroy the infrastructure
Using the correct command, destroy the infrastructure and verify that it has been terminated at the AWS console.

> !! IMPORTANT !! Practice! Spend some time at the Terraform Registry: https://registry.terraform.io/

---
## *Great work!*
---