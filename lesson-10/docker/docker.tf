# This code creates a basic container running NGINX. 
# For this code to work, you must first install the Docker program: 
# https://docs.docker.com/engine/install/
# Make sure that your user account has permission to run Docker commands.
# This code is designed for Linux (and macOS). For Windows, see the comment in the provider block.
# Terraform Docker provider page: https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs

terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

# For Windows add the following indented code inside the curly braces above: host    = "npipe:////.//pipe//docker_engine"

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "test-nginx-container"
  ports {
    internal = 80
    external = 8000
  }
}
