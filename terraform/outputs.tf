output "jenkins_container_id" {
  description = "The ID of the Jenkins container"
  value       = docker_container.jenkins_server.id
}

output "jenkins_container_name" {
  description = "The name of the Jenkins container"
  value       = docker_container.jenkins_server.name
}

output "jenkins_url" {
  description = "Jenkins web interface URL"
  value       = "http://${docker_container.jenkins_server.host}:9091"
}

output "apache_container_id" {
  description = "The ID of the Apache container"
  value       = docker_container.apache_server.id
}

output "apache_container_name" {
  description = "The name of the Apache container"
  value       = docker_container.apache_server.name
}

output "apache_url" {
  description = "Apache web server URL"
  value       = "http://${docker_container.apache_server.host}:8080"
}
