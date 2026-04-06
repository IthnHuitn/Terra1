# 1. Создаем NAT gateway
resource "yandex_vpc_gateway" "nat_gateway" {
  name = "develop-nat-gateway"
  shared_egress_gateway {}
}

# 2. Создаем таблицу маршрутизации
resource "yandex_vpc_route_table" "nat_route" {
  name       = "develop-nat-route"
  network_id = yandex_vpc_network.develop.id

  static_route {
    destination_prefix = "0.0.0.0/0" # Весь трафик в интернет
    gateway_id   = yandex_vpc_gateway.nat_gateway.id
  }
}


resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
  route_table_id = yandex_vpc_route_table.nat_route.id
}

# Создаем вторую подсеть для зоны ru-central1-b
resource "yandex_vpc_subnet" "develop_db" {
  name           = "${var.vpc_name}-db"
  zone           = var.vm_db_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = ["10.0.2.0/24"] 
  route_table_id = yandex_vpc_route_table.nat_route.id
}

data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_image_family
}

# Web VM
resource "yandex_compute_instance" "platform" {
  name        = local.web_vm_name
  platform_id = var.vm_web_platform_id
  zone        = var.default_zone
  
  resources {
    cores         = var.vms_resources["web"].cores
    memory        = var.vms_resources["web"].memory
    core_fraction = var.vms_resources["web"].core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  scheduling_policy {
    preemptible = var.vm_web_preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_web_nat_enabled
  }

  metadata = merge(var.common_metadata, {
    ssh-keys           = "ubuntu:${file(var.vms_ssh_root_key)}"
  })
}

# DB VM
resource "yandex_compute_instance" "platform_db" {
  name        = local.db_vm_name
  platform_id = var.vm_db_platform_id
  zone        = var.vm_db_zone

  resources {
    cores         = var.vms_resources["db"].cores
    memory        = var.vms_resources["db"].memory
    core_fraction = var.vms_resources["db"].core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  scheduling_policy {
    preemptible = var.vm_db_preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop_db.id # Используем новую подсеть
    nat       = var.vm_db_nat_enabled
  }

  metadata = merge(var.common_metadata, {
    ssh-keys           = "ubuntu:${file(var.vms_ssh_root_key)}"
  })
}
