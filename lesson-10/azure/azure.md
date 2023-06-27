# Azure Provider
In this lab we'll create a Microsoft Azure account, install the Azure CLI, and create some basic infrastructure on the Azure cloud. 

> Warning! As with other cloud providers, you may be charged by Microsoft. Be sure to destroy all infrastructure when you are done to limit cost. 

## Create an SSH Key Pair
Verify that you are in the **tac-course/lesson-10** directory.

Run the `ssh-keygen` command to create an RSA-based SSH key-pair. Name the key "ssh_key". Be sure to place the key pair in the keys directory. Verify that it is there.

Move to the lesson-10/azure directory.

## Create an Azure account, install the CLI, and login to Azure
To work with Microsoft Azure, first do the following:

1. Create an Azure account:

    https://portal.azure.com

2. Install the Azure CLI

    See installation instructions at the following link:
    
    https://learn.microsoft.com/en-us/cli/azure/install-azure-cli

    Be sure to install the version for *your* operating system. 

    When complete, verify that it was installed properly by checking the version:

    `az -h`

    The `az` command is what you will use when working in the Azure CLI. 

    > Note: As of the writing of this document, the Azure CLI can be installed to Windows, macOS, Linux (RHEL, SUSE, Debian, Mariner), Docker, or in the Azure Cloud Shell. However, I recommend something local (Linux, Windows, or macOS) so that you can more easily follow along with this lab. As usual, I will be working with a Debian Linux client.

3. Login using the Azure CLI

    Type the following command to login to the Azure Cloud:

    `az login`

    A web browser window should open to an Azure authentication page. Follow the steps as required. Then return back to the CLI.

    > Note: If you are using MFA, then you will need to augment the command:
    > `az login --tenant <TENANT_ID>`.
    > Type in the Tenant ID (likely listed in the CLI) and then authenticate with your smartphone or other device.

    For more information about authenticating via the Azure CLI, see the following link:

    https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs

    > Note: You could also hard-code your credentials into the Terraform code, but it is not recommended. If not using the AZ CLI, consider other methods of securing your credentials. 

    > Note: Optionally, you might need to set the Account ID and Service Principal. For example:
    - > Account ID: `az account set --subscription "<subscription-ID>`
    - > Service Principal: `az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<subscription_ID>`
        
        > The ID is listed when you login.

## Copy and Analyze the Azure Infrastructure Code
Once you have your AZ CLI setup properly, we can copy and view the provided code. 

Move to the "azure" directory. This will be our working directory.

See the file "code.txt" for a sample of Azure code. This code should function as is. 

Copy the code in code.txt to azure.tf either with copy and paste or by simply copying the entire file, for example:

`cp code.txt azure.tf`

> Note: This file contains everything you need. But remember that in the field you will often build separate files: version.tf (for the Terraform version), provider.tf (for the provider plugin information), main.tf (for the resources), variables.tf, and outputs.tf. 

If you wish to change values such as the user password, resource location (region), or others, then do so, but remember that the lab is designed to run in East US. 

Take 5 to 10 minutes analyzing the code that will be used to build a virtual machine on Azure. You will see that the naming conventions are slightly different from AWS. For example:

- The naming convention for a virtual machine is "azurerm_linux_virtual_machine". In addition, we simply call them virtual machines, not instances. 
- The naming convention for a port-based security group is "azurerm_network_security_group"

You will note that there are 8 resources to be terraformed. Can you identify each one? 

## Build Infrastructure on Azure
Now we are ready to run our Terraform commands and build the infrastructure. In this lab we are using the "Standard_B1s" VM image which is very small and should cost less than a dollar to run for one hour. We only need it for a few minutes. 

> Note: For more information on virtual machine sizes and prices, see the following links:

> LINK: Azure Virtual Machine Sizes: https://learn.microsoft.com/en-us/azure/virtual-machines/sizes

> LINK: Azure Pricing Calculator: https://azure.microsoft.com/en-us/pricing/calculator/

Initialize the directory: `terraform init`

This installs the azurerm provider plugin. To learn more about this provider, see the following link:
https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs

Format the code with `terraform fmt`

Validate the code with `terraform validate`

If all is well, perform the terraform run!

`terraform apply`

> Important: As usual, you might incur a small charge with this lab. If you do not want that to happen, do not apply the infrastructure. 

This can take a couple minutes. Continue analyzing the azure.tf code (but don't make any changes!) while the terraform completes.

When finished, check the infrastructure at the Azure web console. 

https://portal.azure.com

It should show the network infrastructure, VM, NIC, and everything else needed to function. 

## SSH into the new Virtual Machine
You will note that the Terraform code outputted the public IP address. If you missed it, you can always see the outputs again with the following command:

`terraform output`

Use the outputted public IP address (and SSH key) to connect to the new VM. 

`ssh -i "../keys/ssh_key" adminuser@<ip_address>`

That should get you into the Ubuntu virtual machine.

Check it by typing `cat /etc/os-release`. That should show the Ubuntu release version. 

Excellent! If you came this far, you did it! Awesome work. 

End the SSH session to the virtual machine.

## Destroy the infrastructure
As always, be sure to destroy any infrastructure you have created, and check it in the web-based console for the provider you are working with. 

`terraform destroy`

Check that everything was destroyed in the Azure console. If there are any leftover resources, destroy them manually. 

Log out of the AZ CLI.

`az logout`

## More Information
For more information on the Azure provider plugin for Terraform, see the following link:

https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs

For an example build of a Linux virtual machine at the Microsoft website, see:

https://learn.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-terraform

For an example build of a Linux virtual machine at the Terraform Registry, see:

https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine

> Note: Code for providers is always progressing and can change over time. Be ready to access the above links to learn more about any future changes.

---
## *Great Work! Now you know two providers!"*
---
