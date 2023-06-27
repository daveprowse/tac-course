# This shows the syntax for downloading the libvirt (KVM) 
# provider and the provider block code.

terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }    
  }
}

# Connect to local KVM. "system" can be an IP or hostname. Use the uniform resource identifier (URI) naming convention.
provider "libvirt" {
  uri = "qemu:///system"
}

#    # or, connect to remote KVM:
# provider "libvirt" {
#   uri = "qemu+ssh://root@<ip_address>/system"
# }

######################

## More information:
# https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs