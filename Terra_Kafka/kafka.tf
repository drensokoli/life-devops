resource "docker_image" "kafka" {
  name         = "bitnami/kafka:latest"
  keep_locally = false
}

resource "docker_container" "kafka" {
  image = docker_image.kafka.image_id
  name  = "kafka01"
  ports {
    internal = 9092
    external = 8008
  }
  networks = ["vala_e_kosoves"]
  env = ["ALLOW_PLAINTEXT_LISTENER=yes", "KAFKA_CFG_ZOOKEEPER_CONNECT=zookeeper-server:2181"]
}
