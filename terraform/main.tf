resource "null_resource" "install_docker" {
  provisioner "local-exec" {
    command = <<EOT
      sudo apt update
      sudo apt install -y docker.io
      sudo systemctl enable --now docker
      sudo usermod -aG docker $USER
      newgrp docker
      sudo systemctl restart docker
    EOT
  }
}

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker" 
      version = "~> 2.0"
    }
  }
}


provider "docker" {
  host = "unix:///var/run/docker.sock" 
}


