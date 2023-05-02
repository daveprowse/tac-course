# Terraform with cloud-init and Viewing Resources
Let's build on the last lesson by adding a cloud-config to our Terraform configuration. This configuration will install an Apache web server and install and configure a mkdocs website.

> Note: The instances and keys directories, as well as the terraform files, have already been created for you. 

## Procedure
- Create a "scripts" directory.
- Create a new ssh key pair. Store it in the keys directory the same way we did in the previous lesson. 

- Add the SSH public key to the main.tf file as we did in the previous lesson. Save the file. 

- Copy the code-script.txt file into your scripts directory. Name it apache-mkdocs.yaml.
  - For example: `cp code-script.txt scripts/apache-mkdocs.yaml`
  - Analyze the new file. This will create a new administrative user, and install the open source mkdocs program.
  - Find "ssh_authorized_keys:" and add your SSH public key in the next line. Save the file.

> Important! Always understand every line of a script before executing it!

- Add the following new line to your main.tf file just before the tags block and just after the closing square bracket (]).

  ```
  user_data = file("../scripts/apache-mkdocs.yaml")
  ```

  Make sure that the path and the filename are exact. 

- From the instances directory, Initialize, validate your code, and apply the new infrastructure. Allow for a couple of minutes for automatic configuration of the system.

At this point, the system should install an Apache web server, install pip, install mkdocs, configure mkdocs, and make it visible as a website.

- SSH into the system. Use the knowledge you learned from the Terraform outputs. This time, you will need to use the "spiderman" account that was created by the cloud-init configuration. Example: 
  ```
  ssh -i "../keys/aws_key" spiderman@<ipaddress>
  ```

- View the hello.txt file and the new website located at /var/www/html

- Attempt to connect to the website from a browser at: 
  
  ```
  http://<ipaddress>
  ```

> Tip: Automatically open the browser to the IP address of the instance from the VSCode terminal. Example: `firefox <ipaddress>`. Replace the browser with your tool of choice!

- Play around with it! You did good!

- When complete, be sure to destroy the infrastructure.

---
## *That was a lot of tech! Great job!*
---


