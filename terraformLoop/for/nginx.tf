resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  for_each = var.names
  image = docker_image.nginx.latest
  name  = each.value
  ports {
    internal = 80
    external = "800${index(var.names_list, each.value)}"
  }
}
