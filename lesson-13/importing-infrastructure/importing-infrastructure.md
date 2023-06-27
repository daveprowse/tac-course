# Importing Infrastructure
It is possible to import existing infrastructure into your current configuration (state file). This lab shows the basics of how to do this. Let's use an AWS instance as an example.

1. Create an AWS instance. 
  
    Do this in the AWS console. Use the free tier (t2.micro) for this instance. 
    > Note: I suggest using Debian, Ubuntu, or Amazon Linux, but whatever you choose, make sure it is free tier compatible!

    Name the instance "instance1". 

    Select "no keypair". 
    
    Create the instance. Verify that it is running in the console and has the correct name: "instance1".
    
    Make note of the name and the ID for the instance. For example, you should have a configuration similar to this:
    - Name: instance1
    - Instance ID: i-0ef987298374...
    - Type: t2.micro

    > Note: Your Instance ID will be different. 

2. Build a main.tf file.

    Include the standard Terraform block and AWS provider block that we have used previously in this course. 

3. Add the resource to be imported.

    In main.tf add the following resource block:
    ```
    resource "aws_instance" "instance1" {
      ami           = "unknown"
      instance_type = "unknown"
       
      tags = {
        "Name" = "unknown"
      }
    }
    ```

    Save the file.

4. Initialize the directory.

    Run `terraform init` to initialize your directory. Make sure the command runs properly with no errors. 

5. Import the resource from AWS.

    The following command should successfully import the AWS resource:

    `terraform import aws_instance.instance1 <Instance ID>`

    Replace the Instance ID portion with whatever instance ID AWS gave you. (The Instance ID is listed in the state file. It is also shown directly after the Name in the AWS console.) 
    
    When you run the command, the instance should be imported into your state file. It is now a Terraform-managed resource! Awesome Sauce!

6. Analyze the state file.

    Verify that you can see the instance in the state file. Take a minute to review the resource's details. 

    
7. View the plan.

    Run `terraform plan` to see what would happen if you applied the infrastructure. It should show that an apply would destroy the instance and create a new one in its place. That's because of our "unknown" attributes in the resource block. 
    
    However, **that's not a best scenario**. Let's fix it.
    
8. Modify the resource block and view the plan again.

    If an import is actually necessary, and is successful, then afterwards it is a best practice to scan the state file and make any necessary changes to the resource in the .tf files. In this case, it simply means adding in the appropriate AMI, instance type, and name tag to our resource. 

    Do the following in main.tf within the resource block: 
    
    - In the ami field, copy and paste the AMI. You can find the AMI in the state file (about 15 to 20 lines down) or in the AWS console in the details tab of your instance.
    - For instance_type, put "t2.micro".
    - For the Name, put "instance1".

    Save the file.

    > Note: Any other information that you might need is listed somewhere in the state file. In general, we try to avoid reading the state file, but sometimes you need to. Being able to read JSON is an important skill for the field. For more information about JSON see: https://tools.ietf.org/html/rfc8259

    Run `terraform plan` again. This time it should say "no changes". Prove it by running a `terraform apply`. Congratulations! You just fixed the resource, and now the existing infrastructure and your state file are equal - with no differences. 

    > Note: If you were to make mundane changes, such as adding tags, those would should up as a "change" during a terraform apply, but the resource would not be removed. 
            
9. Destroy the infrastructure.

    Type `terraform destroy` to destroy the instance. Be sure that it was confirmed in the command line and that it no longer exists in the AWS console. 

Congratulations! You just completed the import lab! You can do this with other cloud-provided resources, docker images, import to modules, and more. Practice with it!

> Note: In fact, HashiCorp has a Docker-based tutorial on this very subject:
https://developer.hashicorp.com/terraform/tutorials/state/state-import

**Further Consideration**

What would happen if you deleted the state file and then tried to apply the configuration? Hmmm?

You might also ask: "What about exporting?" Well, there is no `terraform export` command, but you can certainly export resources from a cloud provider into Terraform.

---
## *Excellent ^*
---

