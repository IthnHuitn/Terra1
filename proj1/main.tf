terraform {
  required_version = "~> 1.12"
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.120"
    }
  }
}

provider "yandex" {
  cloud_id  = "b1gj4je3597r8t17tg2c"
  folder_id = "b1gtustslt38qdmba893"
  zone      = "ru-central1-d"
  token     = var.token
}

# Get the latest Ubuntu 22.04 LTS image
data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2204-lts"
}

# Create the virtual machine
resource "yandex_compute_instance" "vm" {
  name        = var.vm_name
  platform_id = var.vm_platform_id
  zone        = "ru-central1-d"

  resources {
    cores         = var.vm_cores
    memory        = var.vm_memory
    core_fraction = var.vm_core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = 15
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true  # Assign public IP
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.ssh_public_key_path)}"
  }

  scheduling_policy {
    preemptible = var.vm_preemptible
  }
}