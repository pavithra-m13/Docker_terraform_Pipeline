# Pull Jenkins Docker Image
resource "docker_image" "jenkins" {
  name = "jenkins/jenkins:lts-jdk17"
}

# Run Jenkins Container
resource "docker_container" "jenkins_server" {
  image = docker_image.jenkins.image_id
  name  = "jenkins-container"

  ports {
    internal = 8080
    external = 9091
  }

  volumes {
    host_path      = "/var/jenkins_home"
    container_path = "/var/jenkins_home"
  }

  # Mount Docker socket to allow Jenkins to access the Docker engine
  volumes {
    host_path      = "/var/run/docker.sock"
    container_path = "/var/run/docker.sock"
  }

  privileged = true   
  restart    = "always"  

  # Install Docker inside the Jenkins container automatically
  provisioner "remote-exec" {
    inline = [
      "apt-get update && apt-get install -y docker.io",
      "usermod -aG docker jenkins"
    ]
  }
}
