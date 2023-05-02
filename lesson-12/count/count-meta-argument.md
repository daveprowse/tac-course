# Use the count meta-argument!
In this lab you can practice using the count meta-argument which can allow you to setup multiple resources without having to re-type the code
In this directory you will find :
- main.tf 
  - This has a single AWS instance. 
- outputs.tf
  - This will contain a single output reference.

> Note: If you get stuck, see the solution directory.

## Goals
1. Use the count meta-argument to create 2 instances.
2. Refer to that count index to create different names for each instance.
3. Output each instance's public IP address. (Using a splat expression.)

## Procedure
- In main.tf add the count meta-argument within the resource. For example:

`count = 2`

- Now, change the Name tag so that it will create two different names for the two instances using the count_index argument as a variable. Example:

`Name = "Count-Lab-${count.index + 1}"`

> Note: This will work for any amount of instances you specified in the original count.

- In outputs.tf create an output block that will display the public IP addresses of both instances using a splat expression. For example:

```
output "public_ips" {
  description = "Public IP addresses of each of the Instances"
  value       = aws_instance.count_lab[*].public_ip
}
```

- Initialize the directory and apply your infrastructure. 

- Analyze. 
  - In the terminal you should see two outputted public IP addresses.
  - Check the instance names and IP addresses in the state file.
  - Verify the instance names and IP addresses in the AWS console.

- Destroy the infrastructure.

> Note: For more information about the count meta-argument, see the following link: https://developer.hashicorp.com/terraform/language/meta-arguments/count

---
## *Great work!*
---