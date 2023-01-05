resource "docker_image" "ubuntu" {
  name         = "ubuntu:latest"
  keep_locally = false
}

resource "docker_container" "ubuntu" {
  count = length(var.numbers)
  image = docker_image.ubuntu.latest
  name  = var.numbers[count.index] % 2 == 0 ? "ubuntu-${var.numbers[count.index]}-${var.name[1]}" : "ubuntu-${var.numbers[count.index]}-${var.name[0]}"
}
