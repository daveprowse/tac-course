# Working with the Terraform Cloud (TC)
In this lab we'll:
- Create a Terraform Cloud account
- Create a workspace
- Complete a Terraform run in the TC using the CLI
- Conquer the world.

## Create a TC account
https://app.terraform.io/public/signup/account 

> Note: Later, you can sign in at: https://app.terraform.io

You will need a valid email address to validate your account.

> Note: You will also need to use a strong password. Might I suggest KeePass, a KeePass derivative, or other similar locally stored password vault.

## Configure TC
- Create a new organization name (it must be unique!)
- Name and describe your first workspace
- Select CLI-driven workflow

## Configure the main.tf file
- Copy the example code from the overview webpage to the main.tf file (before the rest of the existing code).
> Note: You could also simply place the "cloud" sub block within the already existing Terraform block. (Normally, you would only have one Terraform block.)

- run `terraform init` and notice how it fails. That is because we need to create (and use) a token at the Terraform Cloud.
  
## Login to TC with a token
- Use the `terraform login` command. 
- Copy and paste the token from the browser to the CLI.
- Verify that the connection is valid.

> Note: take a look at the ~/.terraform.d directory and locate the credentials.tfrc.json file. This contains your Terraform Cloud token. This token will remain until deleted from the TC.

## Examine the main.tf file
This is an AWS setup similar to Lab-03 with a single instance.

You will note that we are employing variables. 

- Within the provider block we are calling on the two variables for the keys. 
- Then, instead of using a separate variables.tf file, I simply placed the variables block in the main.tf file. These do not have a description or type as those are not necessary for this lab. 
- Ultimately, those variables' values are defined in the terraform.tfvars file. 

## Copy credentials to the terraform.tfvars file
- Analyze the terraform.tfvars file. This is where you will copy your AWS credentials.
- Locate your credentials file for AWS. By default, it is in:
  ~/home/username/.aws/credentials. Use the cat command to view the contents.
- Copy the access key ID and secret key to terraform.tfvars where it says "Enter ______ Key Here".

> Note: When doing this kind of work, it can be helpful to have two terminals open that you can switch back and forth between. 

---
  **SIDEBAR:** There are several ways to accomplish the task of passing credentials to the Terraform Cloud including: 
  - Hard-coding (not recommended)
  - terraform.tfvars file (our option for this lab)
  - Environment variables (careful though)
  - Terraform Cloud environment variables (recommended)
  - Hashicorp Vault (highly recommended)

  I chose to use terraform.tfvars in this lab for two reasons: 1. We can run everything locally (and without having to incorporate new technologies); and 2. The terraform.tfvars file is meant for this purpose and can be added to your .gitignore file. However, keep in mind that it might not be the best option in team environments. In team scenarios, TC environment vars and/or Vault (or other secrets management tool) is recommended. 

  For example, if you wanted to input your AWS credentials into environment variables in the Terraform Cloud, you would use the following naming conventions:
  ```bash
  AWS_ACCESS_KEY_ID="<accesskey>"
  AWS_SECRET_ACCESS_KEY="<secretkey>"
  ```
  > Note: Be sure to set the "sensitive" flag for these!
  For more information on the various credentials for different providers, see: https://developer.hashicorp.com/terraform/cloud-docs/workspaces/variables#environment-variables

---

## Initialize and apply the code
- Type `terraform init` and verify that the directory was initialized properly. Analyze the .terraform directory that is created and the state file within that was created at this stage.

- Type `terraform apply` and approve it.
- Verify that the instance was created in the AWS console

## Analyze the Terraform run and the state file
- Check the run in the Terraform Cloud
  - Click on the workspace and review it.
  - Then click on the trigger and review the information.
  - Then click on "Apply Finished". Below the CLI results you will find a link to the state file. This is what we call a "remote backend", the main state file is being stored at the TC.
- Compare the local state file with the remote state file. 

## Destroy and logout
- Type `terraform destroy` to destroy the AWS infrastructure.
- Use the `terraform logout` command to end the cloud session and delete the token from the local machine.
  
> Note: Analyze the .terraform.d directory again - the token should be gone.

---
## *Another job well done!*
---