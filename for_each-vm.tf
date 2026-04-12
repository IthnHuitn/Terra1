# ============================================
# DATABASE SERVERS (FOR_EACH)
# ============================================

locals {
  db_instances_map = {
    for vm in var.db_vm_configs : vm.vm_name => vm
  }
}

resource "yandex_compute_instance" "db" {
  for_each = local.db_instances_map

  name        = each.value.vm_name
  platform_id = var.platform_id
  zone        = var.default_zone

  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = var.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      size     = each.value.disk_volume
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
}