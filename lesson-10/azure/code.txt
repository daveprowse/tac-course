terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg_1" {
  name     = "Resource-Group-1"
  location = "East US"
}

resource "azurerm_virtual_network" "network_1" {
  name                = "Network-1"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg_1.location
  resource_group_name = azurerm_resource_group.rg_1.name
}

resource "azurerm_subnet" "subnet_a" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.rg_1.name
  virtual_network_name = azurerm_virtual_network.network_1.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_public_ip" "terraform_public_ip" {
  name                = "PublicIP"
  location            = azurerm_resource_group.rg_1.location
  resource_group_name = azurerm_resource_group.rg_1.name
  allocation_method   = "Dynamic"
}

resource "azurerm_network_security_group" "sg_ssh" {
  name                = "sg-ssh"
  location            = azurerm_resource_group.rg_1.location
  resource_group_name = azurerm_resource_group.rg_1.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface" "nic_1" {
  name                = "NIC-1"
  location            = azurerm_resource_group.rg_1.location
  resource_group_name = azurerm_resource_group.rg_1.name

  ip_configuration {
    name                          = "NIC-1"
    subnet_id                     = azurerm_subnet.subnet_a.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.terraform_public_ip.id
  }
}

resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.nic_1.id
  network_security_group_id = azurerm_network_security_group.sg_ssh.id
}

resource "azurerm_linux_virtual_machine" "azure_vm_1" {
  name                = "Azure-VM-1"
  resource_group_name = azurerm_resource_group.rg_1.name
  location            = azurerm_resource_group.rg_1.location
  size                = "Standard_B1s"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.nic_1.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("../keys/ssh_key.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
}


output "resource_group_name" {
  value = azurerm_resource_group.rg_1.name
}

output "public_ip_address" {
  value = azurerm_linux_virtual_machine.azure_vm_1.public_ip_address
}
