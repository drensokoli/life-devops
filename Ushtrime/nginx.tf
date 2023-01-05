resource "docker_image" "nginx" {
  name         = "nginx:latest"
}

resource "docker_container" "nginx" {
  count = var.env == "prod" ? 3 : 1
  image = docker_image.nginx.image_id
  name  = "nginx01"
  ports {
    internal = 80
    external = "900${count.index}"
  }
  networks = ["my_net"]
}
