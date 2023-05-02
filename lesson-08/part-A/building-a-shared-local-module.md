# Building a Shared Local Module
**Scenario** Setup a webserver module that multiple users can work with.

> Note: To get additional practice working with Terraform, I want you to code everything in this lab line-by-line.

## Create three directories: 
  - modules/webserver
  - yourname-config
  - user2-config

So for example, I would type:

`mkdir -p {modules/webserver,dave-config,user2-config}`

The modules directory can contain whatever modules you wish. In this lab we are creating a single module named webserver.
This module will be re-used by the various users in our group. For now we only have two, but we could add more using the same process that we will follow below.

## Create the module files 
Access the modules/webserver directory. 

Create two files: main.tf and variables.tf.

## Create the module
Here we will code our main.tf and variables.tf files

### main.tf
Access main.tf and add the following blocks:
- terraform block with a required version of 1.3.
- resource block for an aws_subnet named "web_subnet". In this block call two variables:
  - `vpc_id     = var.vpc_id`
  - `cidr_block = var.cidr_block`
  > Note: we will setup the variables later.
- resource block for an aws_instance named "webserver". In this block call three variables:
  - `ami           = var.ami`
  - `instance_type = var.instance_type`
  
  And in tags, 
  - `Name          = "${var.webserver_name} webserver"`
- Add a subnet id argument: 
  - `subnet_id     = aws_subnet.webserver.id`

Save your work!

### variables.tf
Now access variables.tf and add the following five string variables:
- vpc_id
- cidr_block
- ami
- instance_type
- webserver_name

Notice how these correspond to the called variables in main.tf.

> Note: Here is an example of a variable block"
```
variable "vpc_id" {
  type = string
  description = "VPC ID"
}
```

Run `terraform fmt` to re-format all the .tf files in the directory.

Save both files!!

> Note: Normally you would have an outputs.tf file within your module as well, but that is not necessary here as we don't have much to output!

## Create the user configurations
Move to your user folder directory. For example:
`cd ../../dave-config`

Create and edit a main.tf file. Add the following:
- provider block. Be sure to select the region that you want to use. If in doubt, use the one I am using which is us-east-2.
- resource block for the aws_vpc. A good option is to use 10.0.0.0/16
- module block. Here you will call the module (with the *source* argument), and assign values to the variables that are described in the module. For example:
```
module "webserver-dave" {
  source     = "../modules/webserver"
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/16"
  ami        = "ami-0c7c4e3c6b4941f0f"
  # Remember, select an AMI that exists in your AWS region.
  # If in doubt, use the AMI above and the us-east-2 region.
  instance_type  = "t2.micro"
  webserver_name = "Dave's"
}
```
> Note: Remember, if you use a different region, you will need to select a different AMI name that exists in that region.

Run `terraform fmt` to re-format the main.tf file.

Save your work.

This is your working directory. Now you should be able to initialize, validate, plan, and apply your infrastructure. Good luck!

## Check your work
- Verify that the instance is running in the AWS console.
- Analyze the state file.

## Destroy
When you are finished, be 100% sure to destroy your work with the `terraform destroy` command.

---
## *Superb! Another "build & destroy" complete.*
---