# Using Multiple Workspaces in the Terraform CLI
You can have multiple workspaces in a single Terraform working directory. The end result is that you will have multiple state files within the working terraform directory. 

While this is not commonly used, it can be beneficial for side-by-side testing, and a couple of other use cases. 

> Note: You can only have multiple workspaces in the Terraform CLI. Terraform Cloud does not support this, and considers every workspace to be its own entity in its own directory. 

> **WARNING!** This lab may incur cost at AWS.

# Procedure
You will be creating two sets of infrastructure, each with different parameters. However, there will only be one set of configuration files. To make this work, we will employ variables with no defaults. 

---

## Create the Configuration Files
Build Two terraform files.
  - main.tf 
  - variables.tf

## Configure main.tf
Code the following blocks in a similar fashion to previous labs, but use variables as shown below:
- terraform
- provider
  - region = var.region
- resource
  - instance_type = var.instance_type
  - Name = var.name

> Note: If you get stuck with the configuration files, there is a solution directory. *(I was feeling magnanimous.)*

## Configure variables.tf
Add variable blocks for each of the three variables listed above: var.region, var.instance_type, and var.name.

Do not set defaults for the values. You will enter the values manually during the terraform apply. 

> Note: The omission of variable values is one of the main ways that multiple workspace environments are used.

## Create Workspaces
Every Terraform directory has a default workspace (called "default"). View it now with the following command:

`terraform workspace list`

Note the * next to "default". The asterisk tells us which workspace we are currently working in. Right now, it is the only workspace. "Default" always exists, and cannot be deleted. 

Now, let's create two other workspaces for our testing:

`terraform workspace new test1`

`terraform workspace new test2`

That creates two workspaces for us. Note the new directory in our working directory called terraform.tfstate.d. This houses each workspace directory where each state file will be stored later. Also note the "env" file within the .terraform directory. This is a dynamic file that tells us which workspace we are working in. 

You can also find out what workspace you are currently working in with the following command:

`terraform workspace list`

The workspace with the * is the current workspace. Right now, you should be in the test2 workspace. Let's switch to test1.

`terraform workspace select test1`

Confirm that with a `terraform workspace list`. Make sure that the * is next to "test1".

Now we have our two workspaces where we can store separate state files for separate infrastructures. 

## Initialize the Directory 
Run `terraform init` to initialize the directory. This applies to the entire working directory and any applies that we do.

## Create the First Infrastructure
Run `terraform apply`. This will create infrastructure and store its state file in the terraform.tfstate.d/test1 directory. Answer the questions with the following:
  - Instance type = t2.micro
  - Name = test1-instance
  - Region = us-east-2

> Note: If you choose to use other values, make sure to write them down because you will be asked for them again during the destroy stage. 

  Verify that the instance was created in the AWS console and review the state file in the terraform.tfstate.d/test1 directory.

## Switch to the test2 workspace
Run the following command:

`terraform workspace select test2`

Verify that you are now in the test2 workspace with `terraform workspace list`

## Create the Second Infrastructure
Run `terraform apply`. This will create infrastructure and store its state file in the terraform.tfstate.d/test2 directory. Answer the questions with the following:
  - Instance type = t2.nano
  - Name = test2-instance
  - Region = us-east-2

> Note: If you choose to use other values, make sure to write them down because you will be asked for them again during the destroy stage. 

  Verify that the instance was created in the AWS console and review the state file in the terraform.tfstate.d/test2 directory.

> Note: You might also choose to use a different region for the test2 workspace. This way you can test each region separately. However, make note of what region you use and the instance that is running.

> IMPORTANT: Remember that you might incur cost for this lab!

> Use Case Example: One use case for multiple workspaces is to do load testing on each instance to see how they perform. You might find that a lesser instance type is adequate for your needs, ultimately saving you money. The beauty of this is that we don't have to create multiple sets of configuration files in separate working directories.

## Review the State Files
Look at each of the state files in terraform.tfstate.d. Make note of the different values that we selected. Later, if were to come back to this project, the state files will be instrumental in providing information about what we were doing. Especially if there is no other documentation. However, it is a best practice to create a README.md file that documents what we are doing and why.

## Destroy Everything
**BE SURE TO DESTROY *BOTH* SETS OF INFRASTRUCTURE!!!**

Since we are currently in the test2 workspace, let's destroy that infrastructure first:

`terraform destroy`

Enter in the three values for the test2 infrastructure. (Remember that we used a t2.nano here...)

Next, move to the test1 workspace:

`terraform workspace select test1`

Destroy the infrastructure there too:

`terraform destroy`

Enter in the three values for the test1 infrastructure. (Remember that we used a t2.micro here...)

Verify that both sets of infrastructure were destroyed. Review the AWS console and terraform.tfstate.d state files to confirm. 

Now, destroy the workspaces. You will have to switch to the default workspace to do so because you cannot delete a workspace that you are working in.

`terraform workspace select default`

`terraform workspace delete test1`

`terraform workspace delete test2`

Check the working directories That should bring us back to our initialized state. That's it! Great work.

> Note: To reset the working directory to a non-initialized state, simply delete all Terraform-created files and directories, including: 
> .terraform, .terraform.tfstate.d, terraform.tfstate, terraform.tfstate.backup.
> However, the last two should already be gone because we deleted their corresponding workspaces. Remember that!
> A quick way to do this is `rm -r {.t*,t*}`. However, be careful, this will delete any files/directories that start with a 't', including things such as terraform.tfvars and test.tf!

---
## *"Again, it is the legend."*
---






