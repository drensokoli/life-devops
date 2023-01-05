#resource "docker_image" "nginx" {
#  name         = "nginx:latest"
#  keep_locally = false
#}

resource "docker_container" "nginx" {
  image = "sha256:ac8efec875ce36b619cb41f91d9db579487b9d45ed29393dc957a745b1e0024f"
  name  = "some-nginx"
  lifecycle {
    ignore_changes = [
      env
    ]
  }
  log_opts          = {
        "max-file" = "500"
        "max-size" = "10m"
  }
}
