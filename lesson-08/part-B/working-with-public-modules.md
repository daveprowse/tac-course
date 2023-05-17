# Working with Public Modules
**Scenario:** Setup a three-server cluster using common publicly available modules that multiple users can work with.

> IMPORTANT! This lab will incur a cost. If you do not want your credit card to be charged, do not apply the infrastructure!
> Due to the amount of resources that are being created, it could cost a dollar or more. 

> Note: This lab is built to work in the us-east-2 AWS region. It will not function if you change the region (without changing several other parameters in various files.)

# Procedure
This is a longer lab, so I broke it up into subsections. Take your time and analyze the modules and code as you go.

## Setup and Analysis

Make sure your terminal is set to work in the part-B directory.

> Note: This could be known as our "root module".

Analyze the main.tf file. It calls on two modules:

    --> main.tf ↓

      -----> vpc

      -----> ec2_instances
    
vpc and ec2_instances will be downloaded from the Terraform Registry. 

---
## Get the Remote Modules

`terraform get`

You will see that this downloads the vpc and aws_instances modules into the .terraform directory. Take some time and analyze those. Here are their hyperlinks on the Terraform Registry:
- https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest
- https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/latest

Analyze the two modules. You will note that they contain main.tf, variables.tf, and outputs.tf files. These modules contain every input and output that you could possibly ever want for working with AWS. However, we don't need to use *all* of them. We only specify the items we need in our main.tf in the root module.

---
## Run your Terraform Commands

From the working directory, run `terraform init`

Run `terraform validate`

Run `terraform apply`

That should create a three instance cluster of servers

> Note: We could later use these with an S3 web server bucket. The bucket could encompass the entire cluster, and therefore, any files written to the bucket would be mirrored to each instance in the cluster.

---
## Verify and Analyze the Configuration

Verify the new instances in the AWS console. 

View the VPC and subnets.

Do further analysis of the variables used in the root module and in the downloaded modules. 

---

## Cleanup!
Destroy the Terraformed infrastructure:

`terraform destroy`

> IMPORTANT! Verify at the AWS console that the EC2 instances were destroyed.

---
## *Fantastic! You RULE!*
---
