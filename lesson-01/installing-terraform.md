# Installing Terraform
Welcome to the first lab! 
In this lab you will install the Terraform CLI on to your system. Follow the step-by-step directions below.

> Remember! For this course I am demonstrating on a Debian Linux virtual machine. 

Let's do this!

## First - Update your system!
Whatever system you are running, it is a best practice to make sure it is updated before installing Terraform. This will provide you with security updates and the latest functionality.

Restart the system when the update is complete.

## Install Terraform from the Hashicorp Terraform installation web page:

Link: https://learn.hashicorp.com/tutorials/terraform/install-cli 

You can install Terraform manually or from a package manager. For now, I recommend using a package manager because it is the easiest way for beginners. 

For example:

- Linux (apt, dnf, or other package manager)
- macOS: Homebrew - install it at https://brew.sh
- Windows: Chocolatey - install it at https://chocolatey.org

Locate your operating system and install Terraform following the step-by-step directions at the HashiCorp website.

> Note: You might also opt to install the latest binary. To do so, go to https://releases.hashicorp.com/terraform. Locate the latest version for your platform, download it, verify the checksum, unzip it, and copy it to your binaries directory (for example, /usr/local/bin).


## Verify that Terraform is installed and view the version.
`terraform version` 

or

`terraform -v`

---
**Congratulations! You just finished your first lab! GREAT WORK!**


