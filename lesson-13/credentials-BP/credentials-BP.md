# Best Practice for Credentials
This lab goes over some best practices when working with Terraform.

## Don't use credentials within the main terraform files
For example, in the provider block of a main.tf file you can specify an AWS access key and secret key as shown below. This is known as "hard-coding" the credentials. 

```
provider "aws" {
  access_key = "<AWS_ACCESS_KEY>"
  secret_key = "<AWS_SECRET_KEY>"
  region     = "us-east-2"
```

However, this makes the secret key visible to anyone who has access to the terraform directory, and will be impossible to omit from version control. So, this is a bad practice, especially in collaborative environments. 

**AVOID HARD-CODING!**

## Alternatives to Hard-Coding
Instead, it is recommended to do one of the following:

### Use the provider's CLI tool
Store the credentials in the appropriate place. For example, for AWS, install the AWS CLI, and add the credentials, either by running the `aws configure` command, or by manual modifying the credentials file (stored in ~/.aws). 

### Define environment variables
Use the `export TF_VAR` command. This is a 3-step process.
- First, configure the provider block:
  ```hcl  
  provider "aws" {
    access_key = var.AWS_ACCESS_KEY
	secret_key = var.AWS_SECRET_KEY
	region = "us-east-2"
  ```
- Then, configure variables blocks:
  ```hcl
  variable "AWS_SECRET_KEY" {
  type = string
  }

  variable "AWS_ACCESS_KEY" {
  type = string
  }
  ```
- Finally, export the environment variables:
  ```bash
   export TF_VAR_AWS_ACCESS_KEY=<access_key>
   export TF_VAR_AWS_SECRET_KEY=<secret_key>
  ```

> Note: More information: https://developer.hashicorp.com/terraform/cli/config/environment-variables 

### Use the Terraform Cloud
If using the Terraform Cloud, store your credentials there as environment variables with the sensitive attribute checked.

### Use a terraform.tfvars File
Create a terraform.tfvars file to house the credentials. This file will be called upon by a variable in a separate .tf file. It can be done in the same mannner as the previous option, configuring the provider and variable blocks in the same manner. Then, set the credentials in the terraform.tfvars file:
  ```hcl
  AWS_ACCESS_KEY=<access_key>
  AWS_SECRET_KEY=<secret_key>
  ```
  
  However, it is VERY IMPORTANT that you do not check terraform.tfvars into source control. Be sure to list terraform.tfvars in a .gitignore file. This method can be helpful if you don't want database usernames/passwords or other credentials to be written to the state file. 
> More info: https://developer.hashicorp.com/terraform/tutorials/configuration-language/sensitive-variables

### Hashicorp Vault (or similar tool)
!!! **RECOMMENDED** Use another secrets-providing tool such as HashiCorp's Vault. This is the recommended option so that an entire team can call on secrets, but they are encrypted and stored securely. It requires setting up Vault, configuring it, and storing the secrets there. Afterward, call on the credentials from Terraform. Here's a generic example of the code associated with this:
  ```hcl
  provider "vault" {

    address = "https://<vault_address>"
    skip_tls_verify = true
    token = "<token_id>"
  }

  data "vault_generic_secret" "credential" {
    path = "dpro/testing"
  }

  output Namekv1 {
    value = "${data.vault_generic_secret.credential.data["Name"]}"
  }
  ```

Or, use other third-party cloud provided options for securely calling upon credentials.

---
## *Secure your secrets!!*
---