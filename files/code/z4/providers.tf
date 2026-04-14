terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
    template = {
      source  = "hashicorp/template"
      version = "2.0.0"
    }
  }
  required_version = "~>1.14.0"
}

provider "yandex" {
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  service_account_key_file = file(pathexpand(var.service_account_key_file))
  zone                     = var.default_zone
}