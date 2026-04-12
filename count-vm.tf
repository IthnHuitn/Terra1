# ============================================
# WEB SERVERS (COUNT)
# ============================================

resource "yandex_compute_instance" "web" {
  count = var.web_vm_config.count

  name        = "web-${count.index + 1}"
  platform_id = var.platform_id
  zone        = var.default_zone

  resources {
    cores         = var.web_vm_config.cores
    memory        = var.web_vm_config.memory
    core_fraction = var.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      size     = var.web_vm_config.disk_size
      type     = var.boot_disk_type
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

  depends_on = [yandex_compute_instance.db]
}