# vSphere Provider Page: https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs
# Learn more about vSphere: https://docs.vmware.com/en/VMware-vSphere/index.html 

# This is non-functional code used for demonstration purposes only.
# To make this code work, you would need a vSphere setup including at least one configured vCenter device and one ESXi server.
# You would also need a properly configured variables.tf file. 

terraform {
  required_providers {
    vsphere = {
      source = "hashicorp/vsphere"
      version = "2.4.0"
    }
  }
}

provider "vsphere" {
  # In this implementation, it is recommended that you use environment variables for the username and password.
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  # In a production environment we would set the following to false.
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "datacenter" {
  name = "dc-01"
}

data "vsphere_datastore" "datastore" {
  name          = "datastore-01"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = "cluster-01"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "network" {
  name          = "VM Network"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

resource "vsphere_virtual_machine" "vm" {
  name             = "debian-1"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  num_cpus         = 1
  memory           = 1024
  guest_id         = "debian-1"
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  disk {
    label = "disk0"
    size  = 20
  }
}