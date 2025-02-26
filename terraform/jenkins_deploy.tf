resource "docker_image" "jenkins" {
  name = "jenkins/jenkins:lts-jdk17"
}
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

  # Mount Docker socket to allow Jenkins to use host's Docker
  volumes {
    host_path      = "/var/run/docker.sock"
    container_path = "/var/run/docker.sock"
  }
  # Mount the Docker CLI binary (so Jenkins can use the `docker` command)
  volumes {
    host_path      = "/usr/bin/docker"
    container_path = "/usr/bin/docker"
  }  
  privileged   = true
  restart      = "always"
}
