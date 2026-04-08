# count-vm.tf - создание двух ВМ web-1 и web-2

resource "yandex_compute_instance" "web" {
  count = 2
  
  name        = "web-${count.index + 1}"
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
  
  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    security_group_ids = [yandex_vpc_security_group.example.id]
    nat                = true
  }
  
  metadata = {
    ssh-keys = "ubuntu:${file(var.vms_ssh_root_key)}"
  }
  
  depends_on = [yandex_compute_instance.db]
}