# Working with Public Modules
**Scenario:** Setup an S3 bucket with a two-webserver cluster using common publicly available modules and a local module that multiple users can work with.

> IMPORTANT! This lab is built to work in the us-west-2 AWS region. It will not function if you change the region (without changing several other parameters in different files.)

# Procedure
This is a longer lab so I broke it up into subsections. Take your time and analyze the modules and code as you go.

## Setup and Analysis

Make sure your terminal is set to work in the part-B directory.

Analyze the main.tf file. It calls on three modules:

    --> main.tf ↓

      -----> vpc

      -----> ec2_instances

      -----> website_s3_bucket

vpc and ec2_instances will be downloaded from the Terraform Registry. website_s3_bucket is already built and exists locally in the modules directory. 

Change the bucket name to something unique that you would like to use. 

---
## Get the Remote Modules

`terraform get`

You will see that this downloads the vpc and aws_instances modules into the .terraform directory. Take some time and analyze those. Here are their hyperlinks on the Terraform Registry:
- https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest
- https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/latest

Analyze the local module at /module/aws-s3-static-website-bucket. This will create a bucket that houses the two-instance cluster. Also note that there are two .html files located in the www directory. We will upload these later.

---
## Run your Terraform Commands

From the working directory, run `terraform init`

Run `terraform validate`

Run `terraform apply`

Note the outputs. These show the bucket name which you will need to upload files.

---
## Verify and Analyze the Configuration

Verify the new instances in the AWS console. Make sure you are viewing the us-west-2 region (oregon, US).

Open a browser and go to the actual website. It will use the following naming convention:

%bucket-name%.s3-website-us-west-2.amazonaws.com

See if the site is accessible.

---
## Upload Files to the Site. 
Use the `terraform output` command with variable to specify the bucket name. Example:

```bash
aws s3 cp modules/aws-s3-static-website-bucket/www/ s3://$(terraform output -raw website_bucket_name)/ --recursive
```
> Note: if you are using FISH as your shell, you may have to remove the $.

Refresh the webpage and see if the site can display the index.html page and also an error page. 

At this point you should have a working website that is mirrored to two different AWS instances. 

---
## Cleanup!
########################################################

**IMPORTANT!!** 
Delete the files and destroy the bucket when you are done so that you don't incur any charges!

########################################################


Delete the files

```bash
aws s3 rm s3://$(terraform output -raw website_bucket_name)/ --recursive
```

Destroy the bucket and the rest of the Terraformed infrastructure:

`terraform destroy`

> IMPORTANT! Verify at the AWS console that the S3 bucket and the EC2 instances were destroyed.

---
## *Fantastic! You RULE!*
---
