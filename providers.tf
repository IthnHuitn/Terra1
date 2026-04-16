terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }
  }
  required_version = "~>1.14.0"

  # Remote state в S3 с блокировками
  backend "s3" {
    bucket  = "ithn-s3"
    key     = "terraform.tfstate"
    region  = "ru-central1"

    # Встроенный механизм блокировок (Terraform >= 1.6)
    use_lockfile = true

    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }
}

provider "yandex" {
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  service_account_key_file = file(pathexpand(var.service_account_key_file))
  zone                     = var.default_zone
}