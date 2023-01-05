resource "docker_image" "redis" {
  name         = "redis:latest"
  keep_locally = false
}

resource "docker_container" "redis" {
  image = docker_image.redis.image_id
  name  = "redis01"
  ports {
    internal = 6379
    external = 8001
  }
  networks = ["my_net"]
}

##################################################

resource "docker_image" "redis-insight" {
  name         = "redislabs/redisinsight:latest"
  keep_locally = false
}

resource "docker_container" "redis-insight" {
  image = docker_image.redis-insight.image_id
  name  = "redis-insight01"
  ports {
    internal = 8001
    external = 8002
  }
  networks = ["my_net"]
}
