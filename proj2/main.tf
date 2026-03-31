terraform {
  required_version = "~> 1.14"
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
  }
}

# Настройка провайдера Docker для подключения к удаленной ВМ через SSH
provider "docker" {
  host = "ssh://${var.vm_user}@${var.vm_ip}:22"
  ssh_opts = [
    "-o", "StrictHostKeyChecking=no",
    "-o", "UserKnownHostsFile=/dev/null"
  ]
}

# Генерация случайных паролей
resource "random_password" "mysql_root_password" {
  length      = 20
  special     = true
  min_upper   = 2
  min_lower   = 2
  min_numeric = 2
  min_special = 1
}

resource "random_password" "mysql_wordpress_password" {
  length      = 20
  special     = true
  min_upper   = 2
  min_lower   = 2
  min_numeric = 2
  min_special = 1
}

# Скачивание образа MySQL 8
resource "docker_image" "mysql" {
  name         = "mysql:8"
  keep_locally = true
}

# Создание контейнера MySQL
resource "docker_container" "mysql" {
  name  = "mysql-wordpress"
  image = docker_image.mysql.image_id

  ports {
    internal = 3306
    external = 3306
    ip       = "127.0.0.1"
  }

  env = [
    "MYSQL_ROOT_PASSWORD=${random_password.mysql_root_password.result}",
    "MYSQL_DATABASE=wordpress",
    "MYSQL_USER=wordpress",
    "MYSQL_PASSWORD=${random_password.mysql_wordpress_password.result}",
    "MYSQL_ROOT_HOST=%"
  ]

  restart = "unless-stopped"
}