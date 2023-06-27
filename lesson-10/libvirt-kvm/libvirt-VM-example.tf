### NON-FUNCTIONAL
# This is an example of a KVM virtual machine that I setup for a Linux training courses.
# It builds a new volume from a golden image already stored on the KVM system (shown in the source argument).

resource "libvirt_volume" "lnsf-debian-11-server-disk" {
  name   = "lnsf-debian-11-server.qcow2"
  pool   = "VMs-NVME" # List storage pools using virsh pool-list
  source = "/mnt/25a9d2/KVM/template-debian-11-0-10.0.2.0-network"
  format = "qcow2"
}

# Define KVM domain to create
resource "libvirt_domain" "lnsf-debian-11-server" {
  name   = "LNSF-10.0.2.051-debian-11-server"
  memory = "2048"
  vcpu   = 2
  # qemu_agent = true

  connection {
    type        = "ssh"
    host        = "10.0.2.51"
    user        = "root"
  # I already copied this key to the template VM (as root) and modified sshd_config
    private_key = file("keys/kvm_key")
    timeout     = "12m"
  }

  provisioner "remote-exec" {
    inline = [
      "touch /home/user/hello.txt",
      "echo Hello! and welcome to this server! Destroy me when you are done! >> /home/user/hello.txt",
      # doing updates through crontab
      # "apt update && apt upgrade -q -y"
    ]
  }


  cpu {
    mode = "host-model"
  }

  network_interface {
    network_name = "10-network2-NAT" # List networks with virsh net-list
  }

  disk {
    volume_id = libvirt_volume.lnsf-debian-11-server-disk.id
  }

  console {
    type        = "pty"
    target_type = "serial"
    target_port = "0"
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    #  address = ["0.0.0.0"]
    autoport = true
  }

  video {
    type = "qxl"
  }

}

