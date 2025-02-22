  GNU nano 7.2                                          jenkins_deploy.tf                                                   # Pull Jenkins Docker Image
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

  privileged = true
  restart    = "always"
}
