# This is an example of the naming convention syntax in Terraform

```
<block type> "<block label>" "<block label name>" {
  <identifier> = <expression> 
}
```
> "block label name" is the Terraform name, or Terraform ID. 
> The identifier = expression argument might also be referred to as a key-value pair or simply attributes.

A real example of this would be:

```hcl
resource "aws_instance" "app_server" {
  ami = "ami-0c7df786sdf3ghf0f"
}