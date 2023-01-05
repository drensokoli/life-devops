resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  count = var.if_test == true ? 3 : 1
  image = docker_image.nginx.latest
  name  = "nginx-${count.index}"
  ports {
    internal = 80
    external = "800${count.index}"
  }
}
