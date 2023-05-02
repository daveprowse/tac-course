# Setup AWS
In this lab we'll install and configure the AWS CLI. In so doing, we'll make sure that we have a proper set of AWS credentials. Enjoy!

> NOTE: This lab requires that you have an Amazon AWS account. You can create one here: https://aws.amazon.com/. 

> NOTE: I recommend creating a new and separate IAM user for the labs in this repository. See this link for details: https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html

## Install the AWS CLI
For instructions on installing the AWS command line interface on your platform go to:

https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

> NOTE: Be sure to install the AWS CLI to your home directory and not to a Terraform directory. 

> NOTE: You may need to install the curl program first.

When finished run the `aws --version` command to verify that the AWS CLI is installed.

## Create a New AWS Access Key
- Login to your AWS account console. https://console.aws.amazon.com 
- Click on your user account on the upper right.
- Click on Security Credentials and scroll down to "Access Keys".
- Create a new access key using the Command Line Interface (CLI) option. Copy and paste the access key and secret access key somewhere safe, or download the .csv file and store it in a safe place. 
> NOTE: Once the Key is created you will no longer be able to see the secret key in the console. Be sure to copy it immediately and **SHOW IT TO NO ONE!** .

> NOTE: See this link for more about creating access keys: https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html

## Configure the AWS CLI
Open a terminal and issue the following command:

`aws configure`

Enter your access key ID and secret access key ID.

Press Enter (for [none]) for the region name and output format. 

That completes the process for the AWS CLI credentials and configuration. With Terraform, we will call on these default credentials in the upcoming labs. 

> NOTE: Be sure to click "Done" or "Close" to complete the key creation process in the AWS console.

## View your credentials file 
This file (credentials) is stored in a hidden directory within your home directory:

- in Linux/Mac:   ~/.aws  

  To view hidden directories in Linux type `ls -a`
 
- in Windows:     C:\Users\%username%\.aws 

  To view hidden directories in Windows type `dir /ah`

Note the [default] category. You can have multiple access keys stored here within different categories, such as [prod], [dev], [USA], etc..., and call on them individually from Terraform. By default, if there is only one key, Terraform will use that without any specific mention of the key within the tf files. 

> **IMPORTANT!** When you are finished with this course, it is a best practice to delete any access keys that you created, and terminate any running instances in the AWS console (or other cloud provider). Finally, delete any keys or references to those keys on your local machine. 

---
**Congratulations! You just finished another lab! YES!!**
