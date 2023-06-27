# If you decide to use an Azure VM as well, uncomment the depends_on meta-arguments in each resource below.

resource "aws_instance" "web_server_1" {
  # depends_on = [ azurerm_linux_virtual_machine.azure_vm_1 ]
  ami           = "ami-097a2df4ac947655f"
  instance_type = var.instance_type
  key_name      = var.ssh_key
  vpc_security_group_ids = [aws_security_group.sg_webserver_ohio.id]
    
  user_data = file("../scripts/hulk.yaml")

  tags = {
    Name                  = "Web-Server-1"    
    time_created = formatdate("MM DD YYYY hh:mm ZZZ", timestamp())
    department = "Techie-Nerds" 
    ID = "ID-${random_id.instance_id_1.hex}"
  }
}

resource "aws_instance" "web_server_2" {
  # depends_on = [ azurerm_linux_virtual_machine.azure_vm_1 ]
  provider = aws.virginia
  ami           = "ami-053b0d53c279acc90"
  instance_type =  var.instance_type
  key_name      = var.ssh_key
  vpc_security_group_ids = [aws_security_group.sg_webserver_virginia.id]
      
  user_data = file("../scripts/hulk.yaml")
  
  tags = {
    Name                  = "Web-Server-2"    
    time_created = formatdate("MM DD YYYY hh:mm ZZZ", timestamp())
    department = "Techie-Nerds" 
    ID = "ID-${random_id.instance_id_2.hex}"
  }
}

