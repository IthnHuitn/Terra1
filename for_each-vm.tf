# for_each-vm.tf - создание ВМ для БД

variable "each_vm" {
  type = list(object({
    vm_name     = string
    cpu         = number
    ram         = number
    disk_volume = number
  }))
  description = "Database VMs configuration"
  default = [
    {
      vm_name     = "main"
      cpu         = 2
      ram         = 4
      disk_volume = 20
    },
    {
      vm_name     = "replica"
      cpu         = 2
      ram         = 2
      disk_volume = 15
    }
  ]
}

resource "yandex_compute_instance" "db" {
  for_each = {
    for vm in var.each_vm : vm.vm_name => vm
  }
  
  name        = each.value.vm_name
  platform_id = "standard-v1"
  zone        = var.default_zone
  
  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = 20
  }
  
  boot_disk {
    initialize_params {
      image_id = "fd827b91d99psvq5fjit" # Ubuntu 22.04 LTS
      size     = each.value.disk_volume
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
}