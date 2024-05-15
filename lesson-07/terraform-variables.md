# Terraform Variables
Here you will define elements of your configuration using variables instead of hard-coding them into the main terraform file. 

> Note: See the Extra Credit section to learn about the different types of variables that can be used in Terraform.

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

---
## *Great work! See you at the next lab!*
---

## Extra, Extra Credit!!

### Complete the opt-03 lab

This lab can be found [here](../opt-03-variables/opt-03-instructions.md).

### Learn about the different types of variables

The types of variables that Terraform can use are similar to other programming languages. Here's a brief description of some that you can utilize in Terraform:

**Primitive Types**

  - **string**: A sequence of characters. Requires double-quotes.
    - Ex: `"hello world!"`.
  - **number**: A numeric value. Does not use double-quotes.
    - Ex: `2`, `20`, or `17.2014`.
  - **bool**: A boolean value.
    - Ex: `true` or `false`.
    - These are used with conditional logic.

**Complex Types**

  - **list**: (also known as tuple) A sequence of values. Each value sits in double-quotes and are comma-separated. Uses square brackets `[]` as delimiters.
    - Ex: `["us-east-1","us-east-2"]`
    - Code Example: `default = ["Alice", "Bob", "Charlie", "Denise", "Erin", "Frank", "Darth" ]`
      - See [Lab 14 - variables.tf,](../lesson-14/instances/variables.tf) for this example used in a Terraform configuration.
  - **map**: (also known as object) a group of values using labels and values - collectively known as key pairs. Uses curly braces `{}` as delimiters.
    - Ex: `{name = "Bob", occupation = "Programmer"}`
    - In this case, `name` is a label, and `"Bob"` is a value for that label.

> Note: Complex types are also known as collection types.

**No Type**

  - **null**: A `null` value is an omission of value. Defaults will be used if the variable has one. Used often in conditional expressions.

For more information on variable types, see the HashiCorp documentation at [this link](https://developer.hashicorp.com/terraform/language/expressions/types).