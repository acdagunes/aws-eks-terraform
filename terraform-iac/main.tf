# Terraform-ის მოთხოვნები: საჭირო პროვაიდერების განსაზღვრა
terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = ">= 3.0.1" # ვიყენებთ სტაბილურ ვერსიას
    }
  }
}

# Docker Provider-ის კონფიგურაცია
# Terraform ავტომატურად უკავშირდება Unix სოკეტს: unix:///var/run/docker.sock
provider "docker" {}

# რესურსი 1: Docker Image (Nginx-ის იმიჯის მოზიდვა)
resource "docker_image" "nginx_image" {
  name = "nginx:latest"
  keep_locally = true # იმიჯი დარჩება ლოკალურად
}

# რესურსი 2: Docker Container (Nginx-ის კონტეინერის გაშვება)
resource "docker_container" "nginx_container" {
  name  = "terraform_nginx_v7.0.0"
  image = docker_image.nginx_image.name
  
  # ჰოსტის პორტი 8081 გადამისამართებულია კონტეინერის პორტზე 80
  ports {
    internal = 80
    external = 8082
  }

  restart = "always"
}
