terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.0"
    }
  }
}

provider "google" {
  # Modify the project name to match yours!
  project = "project-1-<ID_number>"
  region  = "us-east4"
}

resource "google_compute_network" "vpc_network" {
  name                    = "vpc-network-1"
  auto_create_subnetworks = false
  mtu                     = 1460
}

resource "google_compute_subnetwork" "tf_subnetwork" {
  name          = "subnet-1"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-east4"
  network       = google_compute_network.vpc_network.id
}

# Create a single Compute Engine instance
resource "google_compute_instance" "google_vm_1" {
  name         = "google-vm-1"
  machine_type = "f1-micro"
  zone         = "us-east4-c"
  tags         = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  # Add SSH Support!
  metadata = {
    ssh-keys = file("../keys/ssh_key.pub")
  }

  # Update VM (and do other tasks such as software installations. 
  # Separate additional commands with semi-colons)
  metadata_startup_script = "sudo apt-get update"

  network_interface {
    subnetwork = google_compute_subnetwork.tf_subnetwork.id

    access_config {
      # Applies an external IP address
    }
  }
}

resource "google_compute_firewall" "ssh" {
  name = "allow-ssh"
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  network       = google_compute_network.vpc_network.id
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}

output "public_ip" {
  value = join("", [google_compute_instance.google_vm_1.network_interface.0.access_config.0.nat_ip])
}

