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

resource "docker_image" "cv" {
  name = "narjessdabbech/cv-one-page:latest"
}

resource "docker_container" "cv" {
  image = docker_image.cv.image_id
  name  = "cv_vm2"
  ports {
    internal = 80
    external = 8002
  }
}
