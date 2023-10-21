terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "php" {
  name         = "php"
  keep_locally = false
}

resource "docker_container" "php" {
  image = docker_image.php.image_id
  name  = "tutorial"
}