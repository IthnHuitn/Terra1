# ============================================
# STORAGE DISKS AND VM
# ============================================

# Создаем дополнительные диски
resource "yandex_compute_disk" "storage_disk" {
  count = var.storage_vm_config.extra_disks.count

  name       = "storage-disk-${count.index + 1}"
  type       = var.storage_vm_config.extra_disks.type
  zone       = var.default_zone
  size       = var.storage_vm_config.extra_disks.size
  block_size = 4096
}

# Создаем ВМ storage
resource "yandex_compute_instance" "storage" {
  name        = "storage"
  platform_id = var.platform_id
  zone        = var.default_zone

  resources {
    cores         = var.storage_vm_config.cores
    memory        = var.storage_vm_config.memory
    core_fraction = var.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      size     = var.storage_vm_config.boot_disk_size
      type     = var.boot_disk_type
    }
  }

  # Динамическое подключение дисков
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
    ssh-keys = "${var.ssh_user}:${file(var.vms_ssh_root_key)}"
  }

  depends_on = [yandex_compute_disk.storage_disk]
}