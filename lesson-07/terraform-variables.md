# Terraform Variables
Here you will define elements of your configuration using variables instead of hard-coding them into the main terraform file.

## Procedure - Part 1
- Analyze the main.tf file. This is essentially the same file we used in Lab 04. 
- Create a new file called variables.tf. Copy the code from code-variables.txt to variables.tf. Analyze that new code.
- Modify the main.tf file. Find the "Name" tag. Modify it so that it calls the variable. For example:
  `Name = var.instance_name`
- Initialize, validate and apply the infrastructure.
- Check the name of the instance in the AWS console. It should display the name you chose in variables.tf.

## Procedure - Part 2
- Re-apply the infrastructure with a new name using the variable option in the command line. For example:

  `terraform apply -var "instance_name=newname"`

This overwrites the variable value.
- Verify the new name in the AWS console and state file.
- Destroy the infrastructure.

## Procedure - Part 3
- In variables.tf, remove the "Default" line item. 
- Apply the infrastructure. You should be asked for a name for the instance, because there is no default. Remember the name you choose.
- Check the name of the instance in the AWS console.
- Destroy the infrastructure. You will be required to type the name of the instance exactly. 

## Procedure - Extra Credit!
- Create a variable in main.tf for the AMI. Then, set the value for that AMI in variables.tf. 
> NOTE: You can name a variable whatever you want! As long as the name matches in both files.
> NOTE: Be sure to destroy any infrastructure when complete.

## Extra, Extra Credit!!
Complete the opt-03 lab.

---
## *Great work! See you at the next lab!*
---

