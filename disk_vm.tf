# disk_vm.tf - создание 3 дисков и ВМ storage с подключением этих дисков

# Создаем 3 одинаковых виртуальных диска по 1 Гб с использованием count
resource "yandex_compute_disk" "storage_disk" {
  count = 3
  
  name     = "storage-disk-${count.index + 1}"
  type     = "network-hdd"
  zone     = var.default_zone
  size     = 1
  block_size = 4096
  
  labels = {
    environment = "storage"
    disk_number = tostring(count.index + 1)
  }
}

# Создаем одиночную ВМ с именем "storage"
resource "yandex_compute_instance" "storage" {
  name        = "storage"
  platform_id = "standard-v1"
  zone        = var.default_zone
  
  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }
  
  boot_disk {
    initialize_params {
      image_id = "fd827b91d99psvq5fjit" # Ubuntu 22.04 LTS
      size     = 10
    }
  }
  
  # Динамическое подключение созданных дисков с использованием for_each
  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.storage_disk
    content {
      disk_id = secondary_disk.value.id
    }
  }
  
  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    security_group_ids = [yandex_vpc_security_group.example.id]
    nat                = true
  }
  
  metadata = {
    ssh-keys = "ubuntu:${file(var.vms_ssh_root_key)}"
  }
  
  # Явная зависимость от всех созданных дисков
  depends_on = [yandex_compute_disk.storage_disk]
}