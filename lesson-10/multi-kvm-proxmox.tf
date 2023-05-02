# This shows the syntax for downloading the libvirt (KVM)
# and Telmate/Proxmox providers and provider block code.

terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
    proxmox = {
      source = "telmate/proxmox"
      #version = "<version tag>"
    }
  }
}


provider "libvirt" {
  uri = "qemu:///system"
}

# or, connect to remote KVM:
provider "libvirt" {
  uri = "qemu+ssh://root@<ip_address>/system"
}

provider "proxmox" {
  pm_api_url = "https://proxmox-01.example.com:8006/api2/json"
}