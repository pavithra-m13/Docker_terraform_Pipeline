# Pull Apache (httpd) Docker Image
resource "docker_image" "apache" {
  name = "httpd:latest"
}

# Create Apache Container
resource "docker_container" "apache_server" {
  image = docker_image.apache.image_id
  name  = "apache-container"

  ports {
    internal = 80
    external = 8080
  }
}
