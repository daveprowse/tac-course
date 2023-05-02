# More Variables!
In this lab you can practice with more Terraform variables.
Within you will find :
- main.tf 
  - This has a single AWS instance. (This is the same configuration as the one used in lab-03.)
- variables.tf
  - This contains several variables that are currently set to ask you for information during the `terraform apply`.

## Procedure - Part 1
- Plan. Know which region you will be working in before you initialize the directory.
- Initialize, format, validate, and apply the configuration.
- Answer the questions to complete the apply.
> NOTE: Be sure to make a note of what you typed. You will be asked for this information during the destroy phase. Remember that you can also find this information in the state file.
- Verify the names and values within the state file and in the AWS console.
- Destroy the instance. (You will be asked for the specific values you typed earlier.)
  
## Procedure - Part 2
- Create defaults within variables.tf for each variable.
  - For example: 
  - `default = "opt-03-variables"`
- Re-initialize the directory and apply the infrastructure.
- Verify names and values.
- Destroy the infrastructure.
  
---
## *YES!*
---