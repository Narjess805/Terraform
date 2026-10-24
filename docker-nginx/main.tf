terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  host = "ssh://master-2@192.168.56.20:22"
}

resource "docker_image" "nginx_remote" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx_remote" {
  image = docker_image.nginx_remote.image_id
  name  = "nginx_terraform_remote"
  ports {
    internal = 80
    external = 8002
  }
}
