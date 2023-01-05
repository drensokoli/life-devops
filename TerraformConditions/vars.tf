output "container_name" {
  description = "Name of the Docker container"
  value       = docker_container.nginx.name
}


variable "emri_i_container"{
  type = string
  default = "nginx02"
}
