### !!! NON_FUNCTIONAL !!! ###
# This shows the syntax for downloading the Telmate/Proxmox provider and provider block code.

terraform {
  required_providers {    
    proxmox = {
      source = "telmate/proxmox"
      #version = "<version tag>"
    }
  }
}

# Connect via FQDN or IP address
provider "proxmox" {
  pm_api_url = "https://proxmox-01.example.com:8006/api2/json"
}

# More information:
# https://registry.terraform.io/providers/Telmate/proxmox/latest/docs

#######################################

## Example LXC virtual machine:
resource "proxmox_lxc" "basic" {
  target_node  = "pve"
  hostname     = "lxc-basic"
  ostemplate   = "local:vztmpl/ubuntu-20.04-standard_20.04-1_amd64.tar.gz"
  password     = "LXC_Password"
  unprivileged = true

  // Terraform will crash without rootfs defined
  rootfs {
    storage = "local-zfs"
    size    = "8G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"
  }
}