# Google Computer Engine VM Lab
In this lab we will create a virtual machine in the Google Compute cloud and SSH into it. 

> Warning! As with other cloud providers, you may be charged by Google. Be sure to destroy all infrastructure when you are done to limit cost. 

> As of the writing of this document (May, 2023) the "f1-micro" Google Compute instance costs in the neighborhood of 1 cent per hour. 

> Pricing Calculator: https://cloud.google.com/products/calculator

## Preparatory Work
As with any cloud-based provider, there are several steps we need to complete before we can get to the Terraform portion of the lab. Historically, Google Cloud has required more prep work than other cloud-based services such as AWS and Azure. 

If you are new to Google Cloud, spend some time familiarizing yourself with the service and the console. 

1. Create a Google Cloud account
    
    Do this at https://cloud.google.com/. You won't be able to run the lab without an account! 

    > Note: Chances are that you have a Google account already. That can be used as your Google Cloud account as well. Or, you might opt to create a wholly new account just for testing and educational purposes. 

    > IMPORTANT! Do not use a production account for any of the labs in this course!

2. Create a new project

    Make sure you are logged into Google Cloud, then access the console at https://console.cloud.google.com. 

    Create a new project from the main screen, or if you already have projects there, click on **Select a Project** and then **New Project**. Call it "project-1" and create it. 

3. Setup permissions

    Your account will need Compute Engine permissions to:
      - compute.instance.*
      - compute.firewalls.*

    > Note: If you only have one user (your account user), then that user is known as owner, and should have all permissions already enabled. However, if you want to work with another user, then go to the IAM section, click on the user account you want to use, and modify the permissions there.

4. Enable the Google Engine API for the project. If you can't find the location of this, try: 

    https://console.cloud.google.com/apis/library/compute.googleapis.com?

    > Note: You will need to have a billing account set up with Google Cloud. 

5. Install the gcloud CLI for your operating system:

    https://cloud.google.com/sdk/docs/install

6. Initialize and login with gcloud, and configure the system.
    
    Run the `gcloud init` command.

    You will be asked to login. Agree and login within the browser window that opens. Allow access for your account. 
    
    > Note: Make sure you are using the same account that you selected previously.

    Once authenticated, go back to the terminal. Select the project to use. Look for the one that is called "project-1-<ID>" and enter the number associated with that project.

That's it. You should now be set up with Google Cloud and ready to continue to the next step!

## Review the Code and the Provider Documentation
Open up the provided google.tf file. You will see that it contains the code necessary to build an instance in the Google Cloud. 

Terraform will create a VPC and subnetwork, and then create a Debian VM with SSH support including an SSH firewall rule. It also outputs the public IP of the VM. 

Take 5 to 10 minutes analyzing the code and the naming conventions that Google Cloud uses. For example, an instance is known as "google_compute_instance", and a VPC is simply known as "google_compute_network". 

Take a few minutes to peruse the Google Provider: 

https://registry.terraform.io/providers/hashicorp/google/latest/docs

## Modify the Project Name and check your SSH key
Locate the provider block in google.tf. Modify the project name so that it includes the proper ID after "project-1". 

> Note: This Terraform project will call on the SSH key we created in an earlier sub-lesson within lesson-10/keys. If you did not create an SSH keypair, do so now, place it in the keys directory and name it ssh_key. 

## Initialize, Validate, and Build the Infrastructure
Initialize the working directory. Make sure you are in lesson-10/google

`terraform init`

Validate your code:

`terraform validate`

If all is well, apply the infrastructure! When you apply, it should check the plan and ask you to confirm the creation of 4 resources.

`terraform apply`

If necessary, run the following command to load default credentials:

`gcloud auth application-default login`

> Note: If the specified machine_type (f1-micro) is unavailable, consider using a different zone (for example, us-east4-b) or use a different machine type (for example, e2-standard-2 which is also inexpensive.)

> For more information about the f1-micro machine and the regions/zones it is available on, see: https://gcloud-compute.com/f1-micro.html

> For an entire list of machine families, see: https://cloud.google.com/compute/docs/machine-resource

Verify that the 4 resources were created successfully.

## SSH into the VM
Go to the Google Cloud console. Go to your project.

Access "Compute Engine".

Locate the VM. It should have an SSH option. Click it to SSH into the virtual machine. 

If it works, then you have successfully run the Terraform lab!

## Destroy the Infrastructure
As always, be sure to destroy the VM and supporting network infrastructure. In this case, we built 4 resources. Verify that all 4 are destroyed. 

`terraform destroy`

## Links:
- Google Provider: https://registry.terraform.io/providers/hashicorp/google/latest/docs
- Google Modules: https://registry.terraform.io/browse/modules?provider=google

---
## *Excellent!"*
---

