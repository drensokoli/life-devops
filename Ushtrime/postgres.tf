resource "docker_image" "postgres" {
  name         = "postgres:latest"
}

resource "docker_container" "postgres" {
  image = docker_image.postgres.image_id
  name  = "postgres01"
  ports {
    internal = 5432
    external = 8003
  }
  networks = ["my_net"]
  volumes {
    volume_name = "volumi_im"
    container_path = "/var/lib/postgresql/data"
  }
  env = ["POSTGRES_PASSWORD=admin"]
}

##################################################

resource "docker_image" "pgadmin" {
  name         = "dpage/pgadmin4:latest"
}

resource "docker_container" "pgadmin" {
  image = docker_image.pgadmin.image_id
  name  = "pgadmin"
  ports {
    internal = 80
    external = 8004
  }
  networks = ["my_net"]
  env = ["PGADMIN_DEFAULT_EMAIL=admin@admin.com", "PGADMIN_DEFAULT_PASSWORD=admin"]
}
